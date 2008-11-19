class Pkg < ActiveRecord::Base
  belongs_to :maitainer, :foreign_key => :mainteiner_id, :class_name => "User"
  has_many :versions, :dependent => :destroy
  has_many :installs, :dependent => :destroy
  has_many :comments, :dependent => :destroy
  has_many :karmas, :dependent => :destroy
end
