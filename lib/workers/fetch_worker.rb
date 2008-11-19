class FetchWorker < BackgrounDRb::MetaWorker
  set_worker_name :fetch_worker
  def create(args = nil)
    # this method is called, when worker is loaded for the first time
  end


  def update_pkgs(pkgs)

    for pkg in pkgs

      Pkg.create!(:name => pkg[:name])


    end



  end



  def arch
      update_pkgs(Arch::Fetcher.run!)
  end




end
