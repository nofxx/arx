require "grit"
require "uv"
REPO_PATH = "/var/www/arx-git/"

class Repo < ActiveRecord::Base
  include Grit


  belongs_to :user
  belongs_to :pkg

  validates_presence_of :user
  validates_presence_of :pkg

  def git
    Repo.new(path)
  end

  def before_create
    dir = "#{REPO_PATH}#{pkg.name}/#{user.first_name}"
    Dir.mkdir(dir) unless File.directory?(dir)
    system("")
    self[:path] = dir
    init_repo(dir)
  end

  # SOON BDRB # #  # # # # # #

#  def create_repo
#


#  end

  def init_repo(path)
    Dir.chdir(path) do
      system("git init") # --template
    end
  end

#  u = User.first
#  p = Pkg.last
#  r = p.repos.build
#  r.user = u
#  r.save



  # # # # # ## # # # # #

  def commits; git.commits;             end
  def head;    git.commits.first;       end
  def tree;    git.commits.first.tree;  end #contents;

#head.id
#  # => "e80bbd2ce67651aa18e57fb0b43618ad4baf7750"
#
#  head.parents
#  # => [#<Grit::Commit "91169e1f5fa4de2eaea3f176461f5dc784796769">]
#
#  head.tree
#  # => #<Grit::Tree "3536eb9abac69c3e4db583ad38f3d30f8db4771f">
#
#  head.author
#  # => #<Grit::Actor "Tom Preston-Werner <tom@mojombo.com>">
#
#  head.authored_date
#  # => Wed Oct 24 22:02:31 -0700 2007
#
#  head.committer
#  # => #<Grit::Actor "Tom Preston-Werner <tom@mojombo.com>">
#
#  head.committed_date
#  # => Wed Oct 24 22:02:31 -0700 2007
#
#  head.message
#  # => "add Actor inspect"

  def get_commits(from, max=nil)
    git.commits(from,max)
  end


  def blob
    tree.contents
  end

#    contents.last.name
#  # => "lib"
#
#  contents.last.mode
#  # => "040000"

# blob.id
#  # => "4ebc8aea50e0a67e000ba29a30809d0a7b9b2666"
#
#  blob.name
#  # => "README.txt"
#
#  blob.mode
#  # => "100644"
#
#  blob.size
#  # => 7726
#
#You can get the data of a blob as a string.

#  blob.data
#  # => "Grit is a library to ..."

  def pkgbuild
    blob.select { |b| b.name == "PKGBUILD" }.first#repo find
  end

  def pkgbuild_code
    Uv.parse( pkgbuild.data, "xhtml", "shell-unix-generic", true, "amy")
  end
end
