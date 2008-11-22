class Karma < ActiveRecord::Base
  belongs_to :pkg
  validates_presence_of :user
  validates_presence_of :pkg
  validates_presence_of :version
  validates_presence_of :value

end


# == Schema Info
# Schema version: 20081122103124
#
# Table name: karmas
#
#  id         :integer         not null, primary key
#  pkg_id     :integer         not null
#  user_id    :integer         not null
#  version_id :integer         not null
#  value      :integer         not null
#  created_at :datetime
#  updated_at :datetime
