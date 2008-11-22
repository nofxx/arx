class CreateSomeData < ActiveRecord::Migration
  def self.up
    User.create!(
      :name => "root",
      :login => "root",
      :password => "root123",
      :password_confirmation => "root123",
      :email => "x@nofxx.com"
    )
    User.first.activate!
  end

  def self.down
    User.find_by_login('root').destroy
  end
end
