class Install < ActiveRecord::Base
    belongs_to :pkg, :counter_cache => true
end
