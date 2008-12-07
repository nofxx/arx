class User < ActiveRecord::Base
  generator_for :name,  :method =>      :next_nome
  generator_for :login, :method =>      :next_login
  generator_for :email, :method =>      :next_email
  generator_for :password,              'hdsjdhsjhd'
  generator_for :password_confirmation, 'hdsjdhsjhd'
  generator_for :state => 'active'


  def self.next_nome
    @last ||= "Billy Idol"
    @last = @last.succ
  end

  def self.next_email
    @last_email ||= "mailx@nicehost.com"
    @last_email = @last_email.reverse.succ
    @last_email.reverse!
  end


  def self.next_login
    @last_login ||= "bidol"
    @last_login = @last_login.succ
  end
end
# == Schema Info
# Schema version: 20081122103124
#
# Table name: users
#
#  id                        :integer         not null, primary key
#  activation_code           :string(40)
#  admin                     :boolean         not null
#  builds_count              :integer
#  crypted_password          :string(40)
#  email                     :string(100)
#  login                     :string(40)
#  name                      :string(100)     default("")
#  pkgs_count                :integer
#  remember_token            :string(40)
#  repos_count               :integer
#  salt                      :string(40)
#  state                     :string(255)     not null, default("passive")
#  tu                        :boolean         not null
#  activated_at              :datetime
#  created_at                :datetime
#  deleted_at                :datetime
#  remember_token_expires_at :datetime
#  updated_at                :datetime

