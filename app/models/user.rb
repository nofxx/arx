require 'digest/sha1'

class User < ActiveRecord::Base
  include Authentication
  include Authentication::ByPassword
  include Authentication::ByCookieToken
  include Authorization::StatefulRoles

  has_many :repos, :dependent => :destroy
  has_many :comments, :dependent => :destroy
  has_many :pkgs, :through => :repos
  has_many :maintains, :foreign_key => :maintainer_id, :dependent => :nullify

  validates_presence_of     :login
  validates_length_of       :login,    :within => 3..40
  validates_uniqueness_of   :login
  validates_format_of       :login,    :with => Authentication.login_regex, :message => Authentication.bad_login_message

  validates_format_of       :name,     :with => Authentication.name_regex,  :message => Authentication.bad_name_message, :allow_nil => true
  validates_length_of       :name,     :maximum => 100

  validates_presence_of     :email
  validates_length_of       :email,    :within => 6..100 #r@a.wk
  validates_uniqueness_of   :email
  validates_format_of       :email,    :with => Authentication.email_regex, :message => Authentication.bad_email_message


  def first_name
    name.split(" ").first.downcase
  end


  # HACK HACK HACK -- how to do attr_accessible from here?
  # prevents a user from submitting a crafted form that bypasses activation
  # anything else you want your user to change should be added here.
  attr_accessible :login, :email, :name, :password, :password_confirmation, :admin

  # Authenticates a user by their login name and unencrypted password.  Returns the user or nil.
  #
  # uff.  this is really an authorization, not authentication routine.
  # We really need a Dispatch Chain here or something.
  # This will also let us return a human error message.
  #
  def self.authenticate(login, password)
    return nil if login.blank? || password.blank?
    u = find_in_state :first, :active, :conditions => {:login => login} # need to get the salt
    u && u.authenticated?(password) ? u : nil
  end

  def login=(value)
    write_attribute :login, (value ? value.downcase : nil)
  end

  def email=(value)
    write_attribute :email, (value ? value.downcase : nil)
  end

  protected

    def make_activation_code
        self.deleted_at = nil
        self.activation_code = self.class.make_token
    end


end


# == Schema Info
# Schema version: 20081122103124
#
# Table name: users
#
#  id                        :integer         not null, primary key
#  activation_code           :string(40)
#  admin                     :boolean
#  crypted_password          :string(40)
#  email                     :string(100)
#  login                     :string(40)
#  name                      :string(100)     default("")
#  pkgs_count                :integer
#  remember_token            :string(40)
#  repos_count               :integer
#  salt                      :string(40)
#  state                     :string(255)     not null, default("passive")
#  activated_at              :datetime
#  created_at                :datetime
#  deleted_at                :datetime
#  remember_token_expires_at :datetime
#  updated_at                :datetime
