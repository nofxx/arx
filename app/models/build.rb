class Build < ActiveRecord::Base
  belongs_to :user, :counter_cache => true
  belongs_to :pkg,  :counter_cache => true
  belongs_to :repo, :counter_cache => true
  
  validates_presence_of :repo
  validates_presence_of :pkg

end

# == Schema Info
# Schema version: 20081122103124
#
# Table name: builds
#
#  id         :integer         not null, primary key
#  pkg_id     :integer         not null
#  repo_id    :integer         not null
#  user_id    :integer
#  code       :boolean         not null
#  created_at :datetime
#  updated_at :datetime
