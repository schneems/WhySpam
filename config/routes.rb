ActionController::Routing::Routes.draw do |map|
  map.logout '/logout', :controller => 'sessions', :action => 'destroy'
  map.login '/login', :controller => 'sessions', :action => 'new'
  map.register '/register', :controller => 'users', :action => 'create'
  map.signup '/signup', :controller => 'users', :action => 'new'
  map.manage '/manage', :controller => 'users', :action => 'manage'
  map.report_spam '/report_spam', :controller => 'users', :action => 'report_spam'
  map.secure_form '/secure_form', :controller => 'forms', :action => 'secure_form'
  
  map.spam_survey '/spam_survey', :controller => 'users', :action => 'spam_survey'

  map.search '/search', :controller => 'websites', :action => 'search'
  map.delete_spam '/delete_spam', :controller => 'users', :action => 'delete_spam'
  map.view_all_spam '/view_all_spam', :controller => 'users', :action => 'view_all_spam'
  map.read_spam '/read_spam', :controller => 'users', :action => 'read_spam'
  map.contact_us '/contact_us', :controller => 'users', :action => 'contact_us'
  map.simple_captcha '/simple_captcha/:action', :controller => 'simple_captcha'
  
  map.home '/', :controller => 'users', :action => 'index'
  
  map.resources :tickets
  map.resources :info
 # map.resources :websites
  map.resources :websites, :collection => {:auto_complete_for_customer_url => :get }
  
  
  map.resources :users
  
  map.resources :surveys
  map.resources :forms
  
  
  map.resource :session

  #map.connect 'sc/:controller/:action'
  #map.connect '/:controller/:action'
  #map.home '', :controller => 'contacts', :action => 'index'
  
  map.connect '/:action', :controller => 'users'
  
  map.connect ':controller/:action'
  
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
  
  
  
  
end