#
# Pacman fetcher.... simple thing that could work?
#

module Arch
  module Fetcher

    def self.get_list
      text_list = system("pacman -Sl")

    end




  end


end
