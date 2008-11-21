class Version < ActiveRecord::Base
  belongs_to :pkg
  validates_presence_of :name

end
