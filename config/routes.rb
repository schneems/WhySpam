ActionController::Routing::Routes.draw do |map|
# rake routes | mate
  map.resources :users
  map.root :controller => 'users'
  
  map.logout '/logout', :controller => 'sessions', :action => 'destroy'
  map.login '/login', :controller => 'sessions', :action => 'new'
  map.register '/register', :controller => 'users', :action => 'create'
  map.signup '/signup', :controller => 'users', :action => 'new'
  map.manage '/manage', :controller => 'info', :action => 'index'

  map.form_delete '/form_delete', :controller => 'forms', :action => 'delete'
  
  map.change_password_update '/change_password_update', :controller => 'users', :action => 'change_password_update'
  
  map.change_password '/change_password', :controller => 'users', :action => 'change_password'
  
  map.form_create '/form_create', :controller => 'forms', :action => 'create'
  
  map.report_spam '/report_spam', :controller => 'users', :action => 'report_spam'  
  map.spam_survey '/spam_survey', :controller => 'surveys', :action => 'new'
  map.search '/search', :controller => 'websites', :action => 'index'
  map.delete_spam '/delete_spam', :controller => 'users', :action => 'delete_spam'
  map.view_all_spam '/view_all_spam', :controller => 'info', :action => ''
  
  
  
  map.read_spam '/read_spam', :controller => 'users', :action => 'read_spam'
  map.contact_us '/contact_us', :controller => 'users', :action => 'contact_us'
  
  map.home '/', :controller => 'users', :action => 'test'
  
  map.resources :tickets
  
  map.slop_box '/slop_box', :controller => 'tickets', :action => 'slop_box'
  map.resources :info
  map.resources :websites, :collection => {:auto_complete_for_customer_url => :get }
  
  
  
  map.resources :surveys
  map.resources :forms
  
  
  map.resource :session

  map.simple_captcha '/simple_captcha/:action', :controller => 'simple_captcha'

  
  
  map.connect '/:action', :controller => 'users'
  
  
  map.connect ':controller/:action'
  
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
  
  
  
  
end