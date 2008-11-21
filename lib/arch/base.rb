#
# Pacman fetcher.... simple thing that could work?
#

module Arch
  module Base

    def self.sy
      #text_list = %x["pacman -Sl"]
      Kernel.system("yaourt -Sl --textonly --nocolor &> tmp/pacman.txt")

    end


    def self.syu
      #sy
      File.open('tmp/pacman.txt').each_line do |line|
        process(line)
      end
    end

    def self.process(line)
      @type, @name, @version = line.split(" ")
      @pkg = Pkg.create(:name => @name, :desc => 'todo')
      @pkg.versions.build(:name => @version) unless @pkg.versions.map(&:name).include? @version
    end






  end


end
