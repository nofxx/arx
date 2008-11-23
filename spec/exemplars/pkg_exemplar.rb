class Pkg < ActiveRecord::Base
  generator_for :name, :method => :next_name
  generator_for :desc, "Nice package..."

  def self.next_name
    @last ||= "acl"
    @last = @last.succ
  end
end


# == Schema Info
# Schema version: 20081122103124
#
# Table name: pkgs
#
#  id                :integer         not null, primary key
#  owner_id          :integer
#  arch              :integer
#  build_date        :datetime
#  desc              :text            not null
#  dl_size           :integer
#  installs_count    :integer
#  license           :string(255)
#  logo_content_type :string(255)
#  logo_file_name    :string(255)
#  logo_file_size    :integer
#  md5               :string(255)
#  name              :string(255)     not null
#  rank              :integer         not null, default(0)
#  repos_count       :integer
#  size              :integer
#  url               :string(255)
#  versions_count    :integer
#  created_at        :datetime
#  logo_updated_at   :datetime
#  updated_at        :datetime
