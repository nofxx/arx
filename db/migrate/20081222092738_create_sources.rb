class CreateSources < ActiveRecord::Migration
  def self.up
    create_table :sources do |t|
      t.references :pkg, :null => false
      t.string :url, :null => false
      t.string :state, :limit => 50

      t.timestamps
    end

    add_index :sources, :pkg_id
    add_index :sources, :url
    add_index :sources, :state
  end

  def self.down
    drop_table :sources
  end
end
