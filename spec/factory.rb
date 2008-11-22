# == Annotate Models:
#
# Schema version: 20081122103124
#
# = - - - - - - - - - -
#
# Table name: repos
#
#  id         :integer         not null, primary key
#  pkg_id     :integer         not null
#  user_id    :integer
#  path       :string(255)     not null
#  created_at :datetime
#  updated_at :datetime
#
# = - - - - - - - - - -
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
#
# = - - - - - - - - - -
#
# Table name: installs
#
#  id         :integer         not null, primary key
#  pkg_id     :integer         not null
#  code       :boolean         not null
#  created_at :datetime
#  updated_at :datetime
#
# = - - - - - - - - - -
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
#
# = - - - - - - - - - -
#
# Table name: users
#
#  id                        :integer         not null, primary key
#  activation_code           :string(40)
#  admin                     :boolean
#  crypted_password          :string(40)
#  email                     :string(100)
#  login                     :string(40)
#  name                      :string(100)     default("")
#  pkgs_count                :integer
#  remember_token            :string(40)
#  repos_count               :integer
#  salt                      :string(40)
#  state                     :string(255)     not null, default("passive")
#  activated_at              :datetime
#  created_at                :datetime
#  deleted_at                :datetime
#  remember_token_expires_at :datetime
#  updated_at                :datetime
#
# = - - - - - - - - - -
#
# Table name: comments
#
#  id               :integer         not null, primary key
#  commentable_id   :integer         not null, default(0)
#  pkg_id           :integer         not null
#  user_id          :integer         not null
#  commentable_type :string(15)      not null, default("")
#  content          :text            not null
#  created_at       :datetime
#  updated_at       :datetime
#
# = - - - - - - - - - -
#
# Table name: versions
#
#  id         :integer         not null, primary key
#  pkg_id     :integer         not null
#  desc       :text
#  name       :string(255)     not null
#  created_at :datetime
#  updated_at :datetime

