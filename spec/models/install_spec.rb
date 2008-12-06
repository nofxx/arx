require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Install do
  before(:each) do
#    @valid_attributes = {
#      :pkg => ,
#      :code => false
#    }
  end

  it "should create a new instance given valid attributes" do
  pending
    Install.create!(@valid_attributes)
  end
end
# == Schema Info
# Schema version: 20081122103124
#
# Table name: installs
#
#  id         :integer         not null, primary key
#  repo_id    :integer         not null
#  code       :boolean         not null
#  created_at :datetime
#  updated_at :datetime

