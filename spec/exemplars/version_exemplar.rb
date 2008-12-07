class Version < ActiveRecord::Base
  generator_for :name, :method => :next_name
  generator_for :desc, "Nice version..."

  def self.next_name
    @last ||= "1.1.1"
    @last = @last.succ
  end
end




# == Schema Info
# Schema version: 20081122103124
#
# Table name: versions
#
#  id             :integer         not null, primary key
#  pkg_id         :integer         not null
#  desc           :text
#  installs_count :integer
#  name           :string(255)     not null
#  created_at     :datetime
#  updated_at     :datetime

