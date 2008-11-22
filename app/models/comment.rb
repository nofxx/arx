class Comment < ActiveRecord::Base
  belongs_to :commentable, :polymorphic => true
  belongs_to :pkg
  belongs_to :user
end
