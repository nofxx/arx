#
# Pacman fetcher.... simple thing that could work?
#

module Arch
  module Fetcher

    def self.get_list
      #text_list = %x["pacman -Sl"]
      Kernel.system("pacman -Sl &> tmp/output.txt")

    end


    def self.read_list

    end

    def self.read_row(row)
     @repo, @name, @version = row.split(" ")
    end




  end


end
