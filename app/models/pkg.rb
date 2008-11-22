class Pkg < ActiveRecord::Base

REPO_PATH = "/var/www/arx-git/"
  belongs_to :owner, :foreign_key => :owner_id, :class_name => "User"

  has_many :repos, :dependent => :destroy
  has_many :karmas, :dependent => :destroy
  has_many :versions, :dependent => :destroy
  has_many :installs, :dependent => :destroy
  has_many :comments, :dependent => :destroy


  has_attached_file :logo, :styles => {
    :medium => "300x300>", :thumb => "100x100>" }

  #acts_as_state_machine :initial => :normal, :column => 'state'


  validates_uniqueness_of :name
  validates_presence_of :name
  validates_numericality_of :size, :dl_size, :allow_blank => true


  def before_create
    dir = "#{REPO_PATH}#{name}"
      Dir.mkdir(dir) unless File.directory?(dir)

  end
end
