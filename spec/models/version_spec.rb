require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Version do


  it "should create a new instance given valid attributes" do
    Version.generate!
  end
end


# == Schema Info
# Schema version: 20081122103124
#
# Table name: versions
#
#  id         :integer         not null, primary key
#  pkg_id     :integer         not null
#  desc       :text
#  name       :string(255)     not null
#  created_at :datetime
#  updated_at :datetime

