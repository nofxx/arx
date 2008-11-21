class Pkg < ActiveRecord::Base
  generator_for :name, :method => :next_name
  generator_for :desc, 'Nice package...'

  def self.next_number
    @last ||= "acl"
    @last = @last.succ
  end
end
