require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Comment do
  before(:each) do
#    @valid_attributes = {
#      :user => ,
#      :pkg => ,
#      :content => "value for content"
#    }
  end

  it "should create a new instance given valid attributes" do
  pending
    Comment.create!(@valid_attributes)
  end
end
# == Schema Info
# Schema version: 20081122103124
#
# Table name: comments
#
#  id               :integer         not null, primary key
#  commentable_id   :integer         not null, default(0)
#  pkg_id           :integer         not null
#  user_id          :integer         not null
#  commentable_type :string(15)      not null, default("")
#  content          :text            not null
#  created_at       :datetime
#  updated_at       :datetime

