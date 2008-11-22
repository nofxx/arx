require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Repo do
  before(:each) do
    @valid_attributes = {
      :user => ,
      :path => "value for path"
    }
  end

  it "should create a new instance given valid attributes" do
    Repo.create!(@valid_attributes)
  end
end
# == Schema Info
# Schema version: 20081122103124
#
# Table name: repos
#
#  id         :integer         not null, primary key
#  pkg_id     :integer         not null
#  user_id    :integer
#  path       :string(255)     not null
#  created_at :datetime
#  updated_at :datetime

