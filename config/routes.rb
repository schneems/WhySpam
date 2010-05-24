ActionController::Routing::Routes.draw do |map|
  map.resources :dictionaries

# rake routes | mate
  map.resources :users
  map.foreign_show '/foreign_show/:id', :controller => 'forms', :action => 'foreign_show'
  map.test '/test', :controller => 'users', :action => 'test'
  map.test '/localtest', :controller => 'users', :action => 'localtest'
  
  
  
   map.login '/login', :controller => 'user_sessions', :action => 'new'
   map.logout '/logout', :controller => 'user_sessions', :action => 'destroy'
   map.signup '/signup', :controller => 'users', :action => 'new'
   map.registration '/registration', :controller => 'users', :action => 'create'
   map.admin '/admin', :controller => 'admin'
   map.create_link 'links/create/*url', :controller => 'links', :action => 'create'
   map.show_link 'links/show/*url', :controller => 'links', :action => 'show'

   map.resource :account, :controller => 'users'
   map.resource :password_reset
   map.resources :users
   map.resource :user_session




  map.form_delete '/form_delete', :controller => 'forms', :action => 'delete'
  
  map.change_password_update '/change_password_update', :controller => 'users', :action => 'change_password_update'
  
  map.change_password '/change_password', :controller => 'users', :action => 'change_password'
  
  map.form_create '/form_create', :controller => 'forms', :action => 'create'
  
  
  map.spam_survey '/spam_survey', :controller => 'surveys', :action => 'new'
 # map.search '/search', :controller => 'websites', :action => 'index'
  map.view_all_spam '/view_all_spam', :controller => 'whymail', :action => ''
  
  
  map.root :controller => 'whymail', :action => 'index'
  
  map.home '/', :controller => 'whymail', :action => 'index'
  
  
  map.resources :spamfire, :manage, :slopbox
  
  map.widget '/widget/show/*url', :controller => "grade_widget", :action => "show"
  map.widget_create '/widget/create', :controller => "grade_widget", :action => "create"
  
#  map.show_website_fancy 'website/:url', :controller => 'websites', :action => 'show'
  
  map.show_website 'website/*url', :controller => 'websites', :action => 'show'
  
  
  map.resources :tickets
  map.resources :grade_widget
  
  map.resources :whymail
  map.resources :websites
 ## map.resources :websites, :collection => {:auto_complete_for_customer_url => :get }
  
  map.resources :surveys
  map.resources :forms
  
  
  map.resource :session

  map.simple_captcha '/simple_captcha/:action', :controller => 'simple_captcha'

  
  
 # map.connect '/:action', :controller => 'users'
  
  
  map.connect ':controller/:action'
  
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
  

  
  map.static '/:action', :controller => 'static'
 
 
 
end