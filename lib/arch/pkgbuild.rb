#
# Pacman PKGBUILD Parser#

module Arch
  class Pkgbuild
   	attr_reader :bash_env

   	def initialize(source)
 			bash_script ="source #{source} set "
 			@bash_env = `#{bash_script}`
   	end

 	  def vars
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
	 		return bvars
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
