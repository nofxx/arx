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
