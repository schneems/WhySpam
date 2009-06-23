class WebsitesController < ApplicationController
  auto_complete_for :website, :url

 
   layout "users"
   
   def show
    website_id = params[:id]
    @website = Website.find(:first, :include => [{:surveys => :user}], :conditions => ["id = ?", website_id])
    
    surveys = @website.surveys
    
    @opt_out = []
    @un_solicited = []
    @sell = []
    @vulgar = []
    @give_out = []
    
    for survey in surveys
      if survey.give_out == false
        @opt_out << survey.opt_out
        @un_solicited << survey.un_solicited
        @sell << survey.sell
        @vulgar << survey.vulgar
        @give_out << survey.give_out
      end
    end
        
    

  #  for survey in surveys
  #    
  #  
  #    @comments_time_stamp << survey.created_at
  #    @comments <<  survey.comments
  #    
  #  end
     
   end
   

   def a_z
     puts params[:id]
     value = params[:id]||'A'
     @letter = value
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
