class Comment < ActiveRecord::Base
  belongs_to :commentable, :polymorphic => true
  belongs_to :pkg
  belongs_to :user
end


# == Schema Info
# Schema version: 20081122103124
#
# Table name: comments
#
#  id               :integer         not null, primary key
#  commentable_id   :integer         not null, default(0)
#  user_id          :integer         not null
#  commentable_type :string(15)      not null, default("")
#  content          :text            not null
#  created_at       :datetime
#  updated_at       :datetime

