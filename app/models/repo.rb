class Repo < ActiveRecord::Base
  #include Gitx::Base
 # include Grit
  REPO_PATH = "/var/www/arx-git/"
  USER_PATH = "/var/www/arx-user/"

  belongs_to :pkg, :counter_cache => true
  belongs_to :user, :counter_cache => true

  has_many :comments, :as => :commentable, :dependent => :destroy
  has_many :karmas, :dependent => :destroy
  has_many :builds, :dependent => :destroy

  validates_presence_of :pkg
  validates_presence_of :user
 # validates_presence_of :path
  #validates_uniqueness_of :path

  named_scope :system, :conditions => { :user_id => nil }
  #named_scope :system, :conditions => { :user_id => nil }

  acts_as_state_machine :initial => :new
  state :new
  state :init #, :enter => Proc.new {|p| Bdrb    }
  state :ok
  state :err


  def after_create
    #TODO: send bdrb job
   #self.path = (self.user ? USER_PATH : REPO_PATH) + self.pkg.name
   # create_repo
  end

  # Get user by username method. System pkgs stay apart
  # with this logic. Better ideas are welcome....
  #def username
  #  user ? user.name : "system"
 # end


  # #
  # GIT
  #
  #
  def get_repo
    # bdrb call
   # Repo.new(self.path)
  end

  def git
    get_repo
  end

  def commits
    git.andand.commits
  end
  
  def head;    git.commits.first;       end
  def tree;    git.commits.first.tree;  end #contents;
  def blob;    tree.contents;           end

  def empty?
    commits.andand.empty?
  end

  def get_commits from, max=nil
    git.commits(from, max)
  end

  def pkgbuild
    blob.select { |b| b.name == "PKGBUILD" }.first#repo find
  end

  def install
    blob.select { |b| b.name =~ /.*\.install$/ }.first
  end

  def patches
    blob.select { |b| b.name =~ /.*\.patch$/ }
  end

  def pkgbuild_code
    Uv.parse( pkgbuild.data, "xhtml", "shell-unix-generic", true, "amy")
  end

  def other_files


  end

  def karma
    karmas.average('value')
  end


  # #
  # Commit code
  def commit! msg = ""
    git.add
    git.commit_index(msg)
  end
end

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


# == Schema Info
# Schema version: 20081122103124
#
# Table name: repos
#
#  id           :integer         not null, primary key
#  pkg_id       :integer         not null
#  user_id      :integer
#  builds_count :integer
#  path         :string(255)     not null
#  created_at   :datetime
#  updated_at   :datetime
