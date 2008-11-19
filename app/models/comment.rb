class Comment < ActiveRecord::Base
  belongs_to :pkg
  belongs_to :user
end
