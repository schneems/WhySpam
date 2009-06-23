class SurveysController < ApplicationController
  # Be sure to include AuthenticationSystem in Application Controller instead
  layout "users"
  

  def a_z
    puts params[:id]
    value = params[:id]||'A'
    
    unless read_fragment({:page => params[:page]||1, :ltr => value||"All"})    
           site_pagination = Website.find(:all, 
             :conditions => [ 'LOWER(url) LIKE ?',
              '%' + value.downcase + '%'], 
               :order => 'url ASC') 

         @websites = site_pagination.paginate :page => params[:page], :order => 'word ASC', :per_page => 90
    end # unless
        
  end
  
  def search
    value = params[:query]
    @websites = Website.find(:all, :conditions => [ 'LOWER(url) LIKE ?',
        '%' + value.downcase + '%'], 
         :order => 'url ASC')
         
         
  end



  def index
   # websites = Websites.find(:all, :limit => 100, :include => :surveys)
   #  @surveys = Surveys.find(:all, :limit => 100, :order => "")
   @websites = Website.find(:all, :include => :surveys, :conditions => [], :limit => 20, :order => "created_at ASC" )
  end

  

 # def create
 #   if logged_in?
 #     puts params[:survey]
 #     info_id = params[:info]
 #     info = Info.find(:first, :include => :user, :conditions => ["id = ?", info_id])
 #     website = Website.create(:url => info.website)
 #   
 #     if params[:survey] != nil
 #       website.surveys.create(params[:survey])
 #     end
 #    # info.cryptmail = nil
 #     info.destroy if info.user == current_user
 #     render :action => "manage", :controller => 'users'
 #   end
 # end
  
  

end