class Pkg < ActiveRecord::Base


end
# == Schema Info
# Schema version: 20081122103124
#
# Table name: repos
#
#  id         :integer         not null, primary key
#  pkg_id     :integer         not null
#  user_id    :integer
#  path       :string(255)     not null
#  created_at :datetime
#  updated_at :datetime

