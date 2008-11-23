require "grit"

module Gitx
  module Base
    include Grit


    def get_repo
      Repo.new(path)
    end


    def create_repo
      Dir.mkdir(path) unless File.directory?(path)
      Dir.chdir(path) { system("git init") } # --template
    end

    def write_out(fname,text)
      Dir.chdir(path) do
        File.open(fname, 'w') { |f| f.write('hellor ' + fname) }
      end
    end

    def export_tarball
      Dir.chdir(path) do
      system("git archive --format=tar --prefix=tarballs/ HEAD\
       | tar czvf > #{name}.tar.gz")
      end
    end




  end
end
