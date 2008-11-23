ActionController::Routing::Routes.draw do |map|

  # Root home controller
  map.root :controller => 'home', :action => 'index'

  map.resources :pkgs, :member => { :fork => :get },
    :has_many => [:repos, :comments]


  map.resources :repos, :has_many => [:comments, :files]
  map.resources :installs
  map.resources :karmas
  map.resources :comments
  map.resources :versions

  map.logout    '/logout',    :controller => 'sessions', :action => 'destroy'
  map.login     '/login',     :controller => 'sessions', :action => 'new'
  map.register  '/register',  :controller => 'users', :action => 'create'
  map.signup    '/signup',    :controller => 'users', :action => 'new'
  map.activate '/activate/:activation_code', :controller => 'users', :action => 'activate', :activation_code => nil

  map.resources :users, :has_many => [:pkgs],
   :member => { :suspend => :put, :unsuspend => :put, :purge => :delete }


  map.resource :session
  # consider removing the them or commenting them out if you're using named routes and resources.
#  map.connect ':controller/:action/:id'
#  map.connect ':controller/:action/:id.:format'
end
