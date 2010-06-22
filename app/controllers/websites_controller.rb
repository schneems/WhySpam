class WebsitesController < ApplicationController
  auto_complete_for :website, :url

 
   
   def show
    @myurl = params[:url] || ""
    @myurl = @myurl.to_s
    website_id = params[:id]
    
    @website = Website.find(:first, :include => [{:surveys => :user}], :conditions => ["id = ?", website_id])||Website.find(:first, :include => [{:surveys => :user}], :conditions => ["url = ?", @myurl])
    
    if !@website.nil?      
      @whymail_count = Whymail.find(:all, :conditions => ["website = ?", @myurl ]).count
      @percent_deleted = 100 * @website.surveys.count / (@website.surveys.count + @whymail_count ) if (@whymail_count  + @website.surveys.count) != 0 
      @percent_deleted = @percent_deleted||100 
    end  
    
    @myurl = "No Website Was Given" if @myurl.to_s.strip == ""
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


#   def search
#     value = params[:query]
#     @websites = Website.find(:all, :conditions => [ 'LOWER(url) LIKE ?',
#         '%' + value.downcase + '%'], 
#          :order => 'url ASC')
#
#
#   end



   def index
    options = {
      :order => 'created_at DESC'
      # :page => params[:page]
    }

    if params[:query]
      options[:conditions] = [ "LOWER(url) LIKE :query", {:query => "%#{params[:query]}%"} ]
      options[:order] = 'created_at DESC'
    #  options[:limit] = 1000
      options[:include] = :surveys
    end
    
    options[:limit] = 1000
    
    
    @websites = Website.find(:all,  options)
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @websites }
      format.rss  # index.rss.builder
    end
   end



 
 
end
