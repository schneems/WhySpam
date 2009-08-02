class WebsitesController < ApplicationController
  auto_complete_for :website, :url

 
   layout "users"
   
   def show
    website_id = params[:id]
    @website = Website.find(:first, :include => [{:surveys => :user}], :conditions => ["id = ?", website_id])
    @opt_out_count = @website.opt_out_count
    @un_solicited_count = @website.un_solicited_count
    @sell_count = @website.sell_count
    @vulgar_count = @website.vulgar_count
    @give_out_count = @website.give_out_count 
    
    if !@website.surveys.nil?
      @surveys_count = @website.surveys.count 
      @surveys_count -= @give_out_count
    else      
    end
    ## @surveys_count - @opt_out_count
    #@surveys_count - @opt_out_count
   end
   

   def a_z
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
    options = {
      :order => 'created_at ASC'
      # :page => params[:page]
    }
    if params[:query]
      options[:conditions] = [ "LOWER(url) LIKE :query", {:query => "%#{params[:query]}%"} ]
      options[:order] = 'created_at ASC'
      options[:limit] = 100
      options[:include] = :surveys
    end
    
    ## @websites = Website.find(:all, :include => :surveys, :conditions => [], :limit => 100, :order => "created_at ASC" )
    
    @websites = Website.find(:all,  options)
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @websites }
      format.rss  # index.rss.builder
    end
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
