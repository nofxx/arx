require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Karma do

  it "should create a new instance given valid attributes" do
    Karma.generate!
  end
end
# == Schema Info
# Schema version: 20081122103124
#
# Table name: karmas
#
#  id         :integer         not null, primary key
#  repo_id    :integer         not null
#  user_id    :integer         not null
#  value      :integer         not null
#  created_at :datetime
#  updated_at :datetime

