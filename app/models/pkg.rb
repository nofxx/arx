class Pkg < ActiveRecord::Base

  belongs_to :owner, :foreign_key => :owner_id, :class_name => "User"

  has_many :repos, :dependent => :destroy

  has_many :versions, :dependent => :destroy
  has_many :comments, :as => :commentable, :dependent => :destroy
  has_many :users, :through => :repos


  has_attached_file :logo, :styles => {
    :medium => "300x300>", :thumb => "100x100>" },
    :default_url => "/images/default_:style_logo.png"

  def to_param
    #name.paremeterized => 2.2
    name
  end


 # acts_as_state_machine :initial => :normal, :column => 'state'


  validates_uniqueness_of :name
  validates_presence_of :name
  validates_numericality_of :size, :dl_size, :allow_blank => true
  validates_format_of :name, :with => /^(\d|[A-Z])+$/

  def owner_name
    owner ? owner.name : 'orphan'
  end

  def after_create
    self.repos.build.save
  end

  def karma
    karmas.average('value')
  end


end


# == Schema Info
# Schema version: 20081122103124
#
# Table name: pkgs
#
#  id                :integer         not null, primary key
#  owner_id          :integer
#  arch              :integer
#  build_date        :datetime
#  desc              :text            not null
#  dl_size           :integer
#  installs_count    :integer
#  license           :string(255)
#  logo_content_type :string(255)
#  logo_file_name    :string(255)
#  logo_file_size    :integer
#  md5               :string(255)
#  name              :string(255)     not null
#  rank              :integer         not null, default(0)
#  repos_count       :integer
#  size              :integer
#  url               :string(255)
#  versions_count    :integer
#  created_at        :datetime
#  logo_updated_at   :datetime
#  updated_at        :datetime
