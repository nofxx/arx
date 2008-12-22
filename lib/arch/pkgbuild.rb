#
# Pacman PKGBUILD Parser#

module Arch
  class Pkgbuild
   	attr_reader :bash_env, :pkgname, :pkgver, :pkgrel, :pkgdesc,
      :url, :license, :source, :depends, :provides, :conflicts

   	def initialize(source)
 			bash_script ="\
source #{source}
set
" #	="source #{source} set "
 			@bash_env = `#{bash_script}`
      parse
   	end


    def x32?
      @x32
    end

    def x64?
      @x64
    end

    def install
      @install
    end

 	  def parse
 		  bvars={}
 		  re=MultiRegexp.new('(\w*)=(.*)$', true)

 		  re.matches(@bash_env) do |i|
 			  if (i[1] != "")
 				  if i[2] =~ /\(([^\)]*)\)/
 					  ta=Array.new
 					  re_a=MultiRegexp.new('\[\d*\]=\"([^"]*)\"', true)
 					  re_a.matches($1) do |j|
 						  ta.push(j[1])
 					  end
 					  bvars[i[1]]=ta
 				  elsif
 					  bvars[i[1]]=i[2]
 				  end
 				end
 			end
	 	#	return bvars
      @pkgname = bvars['pkgname']
      @pkgver  = bvars['pkgver']
      @pkgrel  = bvars['pkgrel'].to_i
      @pkgdesc  = bvars['pkgdesc']
      @x32 = bvars['arch'].include? "i686"
      @x64 = bvars['arch'].include? "x86_64"
      @url = bvars['url']
      @license = bvars['license']
      @source = bvars['source']
      @install = bvars['install']
      @depends = bvars['depends']
      @provides = bvars['provides']
      @conflicts = bvars['conflicts']
 		end


    def self.export(pkg)

    end




  end

  #http://www.friendsnippets.com/snippet/9/
  class MultiRegexp < Regexp
    def matches(str)
      str.scan(self) do
        yield Regexp.last_match
      end
    end
  end
end


# class EnvBash
#50 # test on a pkgbuild (archlinux)
#51 bashvars=EnvBash.new("/var/abs/kernels/kernel26/PKGBUILD")
#52
#53 bvars=bashvars.vars
#54         puts "#{bvars['pkgname']}-#{bvars['pkgver']}-#{bvars['pkgrel']}"
#55
#56 if bvars['source'].instance_of?(Array)
#57     puts "sources : "
#58     bvars['source'].each { |src|
#59         puts src
#60     }
#61 end
#end
