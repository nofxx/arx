class Repo < ActiveRecord::Base

  generator_for :path, "/some/path"

end




# == Schema Info
# Schema version: 20081122103124
#
# Table name: repos
#
#  id           :integer         not null, primary key
#  pkg_id       :integer         not null
#  user_id      :integer
#  builds_count :integer
#  path         :string(255)     not null
#  created_at   :datetime
#  updated_at   :datetime

