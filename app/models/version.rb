class Version < ActiveRecord::Base
  belongs_to :pkg
  validates_presence_of :name
  validates_presence_of :pkg

  validates_uniqueness_of :name, :scope => :pkg_id
end


# == Schema Info
# Schema version: 20081122103124
#
# Table name: versions
#
#  id             :integer         not null, primary key
#  pkg_id         :integer         not null
#  desc           :text
#  installs_count :integer
#  name           :string(255)     not null
#  created_at     :datetime
#  updated_at     :datetime

