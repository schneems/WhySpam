class WebsitesController < ApplicationController
  auto_complete_for :website, :url

 
   
   def show
    @myurl = params[:url] || ""
    website_id = params[:id]
    @website = Website.find(:first, :include => [{:surveys => :user}], :conditions => ["id = ?", website_id])||Website.find(:first, :include => [{:surveys => :user}], :conditions => ["url = ?", @myurl])
    if !@website.nil?      
      @opt_out_count = @website.opt_out_count || 0
      @un_solicited_count = @website.un_solicited_count || 0
      @sell_count = @website.sell_count || 0
      @vulgar_count = @website.vulgar_count || 0 
      @give_out_count = @website.give_out_count || 0
      
      if !@website.surveys.nil? && !@website.surveys.empty?
        @surveys_count = @website.surveys.count 
        @surveys_count -= @give_out_count  
      else  
        @surveys_count = 0  
      end  
    end  
    
    @myurl = "No Website Was Given" if @myurl.strip == ""
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
      :order => 'created_at ASC'
      # :page => params[:page]
    }

    if params[:query]
      options[:conditions] = [ "LOWER(url) LIKE :query", {:query => "%#{params[:query]}%"} ]
      options[:order] = 'created_at ASC'
      options[:limit] = 100
      options[:include] = :surveys
    end
    
    @websites = Website.find(:all,  options)
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @websites }
      format.rss  # index.rss.builder
    end
   end



 
 
end
