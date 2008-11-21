namespace :arch do
  desc "Check package list"
  task :sy => :environment do
    Arch::Base.sy
  end

  desc "Update database"
  task :syu => :environment do
    Arch::Base.syu
  end

end
