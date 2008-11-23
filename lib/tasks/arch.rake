namespace :arch do
  desc "Check package list"
  task :sy => :environment do
    Arch::Pacman.sy
  end

  desc "Update database"
  task :syu => :environment do
    Arch::Pacman.syu
  end

end
