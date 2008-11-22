require "grit"

module Gitx
  module Base
    include Grit

    REPO_PATH = "/var/www/arx-git/"
    USER_PATH = "/var/www/arx-user/"

    def get_repo(path)
      Repo.new(path)
    end

    def create_repo(pkg, user = nil)
      dir = (user ? USER_PATH : REPO_PATH) + pkg.name
      Dir.mkdir(dir) unless File.directory?(dir)
      init_repo(dir)
      dir
    end

    def init_repo(path)
      Dir.chdir(path) do
        system("git init") # --template
      end
    end

    def write_out(repo, fname,text)
          Dir.chdir(repo) do
        File.open(fname, 'w') { |f| f.write('hellor ' + fname) }
          end






end





  end
end
