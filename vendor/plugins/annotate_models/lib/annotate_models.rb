require "config/environment"

MODEL_DIR         = File.join(RAILS_ROOT, "app/models" )
UNIT_TEST_DIR     = File.join(RAILS_ROOT, "test/unit"  )
SPEC_MODEL_DIR    = File.join(RAILS_ROOT, "spec/models")
FIXTURES_DIR      = File.join(RAILS_ROOT, "test/fixtures")
SPEC_FIXTURES_DIR = File.join(RAILS_ROOT, "spec/fixtures")
EXEMPLARS_DIR     = File.join(RAILS_ROOT, "spec/exemplars")
SORT_COLUMNS      = ENV['SORT'] ? ENV['SORT'] != 'no' : true
FACTORY_FILE      = File.
  join(RAILS_ROOT, "spec/factory.rb")  ||  File.
  join(RAILS_ROOT, "test/factory.rb") rescue nil

module AnnotateModels

  PREFIX = "== Schema Info"

  # Simple quoting for the default column value
  def self.quote(value)
    case value
      when NilClass                 then "NULL"
      when TrueClass                then "TRUE"
      when FalseClass               then "FALSE"
      when Float, Fixnum, Bignum    then value.to_s
      # BigDecimals need to be output in a non-normalized form and quoted.
      when BigDecimal               then value.to_s('F')
      else
        value.inspect
    end
  end

  # Use the column information in an ActiveRecord class
  # to create a comment block containing a line for
  # each column. The line contains the column name,
  # the type (and length), and any optional attributes
  def self.get_schema_info(klass, header)
    info = "# Table name: #{klass.table_name}\n#\n"

    max_size = klass.column_names.collect{|name| name.size}.max + 1
    if SORT_COLUMNS
        pk    = klass.columns.find_all { |col| col.name == klass.primary_key }.flatten
        assoc = klass.columns.find_all { |col| col.name.match(/_id$/) }.sort_by(&:name)
        dates = klass.columns.find_all { |col| col.name.match(/_on$/) }.sort_by(&:name)
        times = klass.columns.find_all { |col| col.name.match(/_at$/) }.sort_by(&:name)

        pk + assoc + (klass.columns - pk - assoc - times - dates).compact.sort_by(&:name) + dates + times
      else
        klass.columns
      end.each { |col| info << annotate_column(col, klass, max_size) }
      anotate_factory(info) if FACTORY_FILE
    info << "\n"
    info = "# #{header}\n#\n" + info
  end

  def self.annotate_column(col, klass, max_size)
      attrs = []
      attrs << "not null" unless col.null
      attrs << "default(#{quote(col.default)})" if col.default
      attrs << "primary key" if col.name == klass.primary_key

      col_type = col.type.to_s
      if col_type == "decimal"
        col_type << "(#{col.precision}, #{col.scale})"
      else
        col_type << "(#{col.limit})" if col.limit
      end
      sprintf("#  %-#{max_size}.#{max_size}s:%-15.15s %s", col.name, col_type, attrs.join(", ")).rstrip << "\n"
  end

  # Add a schema block to a file. If the file already contains
  # a schema info block (a comment starting
  # with "Schema as of ..."), remove it first.
  # Mod to write to the end of the file

  def self.annotate_one_file(file_name, info_block)
    if File.exist?(file_name)
      content = File.read(file_name)

      # Remove old schema info
      content.sub!(/^# #{PREFIX}.*?\n(#.*\n)*\n/, '')
      # Write it back

      File.open(file_name, "w") do |f|
        f.puts ENV['POSITION'] == 'top' ?  info_block + content : content + info_block
      end
    end
  end

  # Given the name of an ActiveRecord class, create a schema
  # info block (basically a comment containing information
  # on the columns and their types) and put it at the front
  # of the model and fixture source files.

  def self.annotate(klass, header)
    info = get_schema_info(klass, header)
    model_name = klass.name.underscore
    fixtures_name = "#{klass.table_name}.yml"

    [
      File.join(MODEL_DIR,          "#{model_name}.rb"),      # model
      File.join(UNIT_TEST_DIR,      "#{model_name}_test.rb"), # test
      File.join(FIXTURES_DIR,       fixtures_name),           # fixture
      File.join(SPEC_MODEL_DIR,     "#{model_name}_spec.rb"), # spec
      File.join(SPEC_FIXTURES_DIR,  fixtures_name),           # spec fixture
      File.join(EXEMPLARS_DIR,      "#{model_name}_exemplar.rb"),
    ].each { |file| annotate_one_file(file, info) }
  end

  # Return a list of the model files to annotate. If we have
  # command line arguments, they're assumed to be either
  # the underscore or CamelCase versions of model names.
  # Otherwise we take all the model files in the
  # app/models directory.
  def self.get_model_names
    models = ENV['MODELS'] ? ENV['MODELS'].split(',') : []

    if models.empty?
      Dir.chdir(MODEL_DIR) do
        models = Dir["**/*.rb"]
      end
    end
    models
  end

  # We're passed a name of things that might be
  # ActiveRecord models. If we can find the class, and
  # if its a subclass of ActiveRecord::Base,
  # then pas it to the associated block
  def self.do_annotations
    header = PREFIX.dup
    header << get_schema_version

    annotated = self.get_model_names.inject([]) do |list, m|
      class_name = m.sub(/\.rb$/, '').camelize
      begin
        klass = class_name.split('::').inject(Object){ |klass,part| klass.const_get(part) }
        if klass < ActiveRecord::Base && !klass.abstract_class?
          list << class_name
          self.annotate(klass, header)
        end
      rescue Exception => e
        puts "Unable to annotate #{class_name}: #{e.message}"
      end
      list
    end
    write_factory if FACTORY_FILE
    puts "Annotated #{annotated.join(', ')}"
  end

  def self.get_schema_version
    version = ActiveRecord::Migrator.current_version rescue 0
    version > 0 ? "\n# Schema version: #{version}" : ''
  end

  def self.anotate_factory(info)
    @all ||= []
    @all << "#\n# = - - - - - - - - - -\n#\n#{info}"
  end

  def self.write_factory
    content = File.read(FACTORY_FILE)
    prefix = '== Annotate Models:'
    @all = "# #{prefix}\n##{get_schema_version}\n#{@all}\n"
    content.sub!(/^# #{prefix}\n(#.*\n)*/, '')
    File.open(FACTORY_FILE, "w") do |f|
      f.puts ENV['POSITION'] == 'top' ?  @all + content : content + @all
    end
  end
end
