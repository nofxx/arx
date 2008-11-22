class Install < ActiveRecord::Base
    belongs_to :pkg, :counter_cache => true
end

# == Schema Info
# Schema version: 20081122103124
#
# Table name: installs
#
#  id         :integer         not null, primary key
#  pkg_id     :integer         not null
#  code       :boolean         not null
#  created_at :datetime
#  updated_at :datetime
