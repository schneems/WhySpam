class SurveysController < ApplicationController
  # Be sure to include AuthenticationSystem in Application Controller instead
  layout "application" , :except => [:new ]

  def new
    whymail_id = params[:id]
    @whymail = Whymail.find(:first, :include => [:tickets, :user] , :conditions => ["id = ?", whymail_id] )
    @website = @whymail.website
    site = Website.find(:first, :conditions => ["url = ?", @website])||Website.create(:url => @website, :grade => 'NA', :rank => 100)
    if !site.nil? && site.save
      @survey = site.surveys.create(:opt_out => "false", :un_solicited=> "false", :sell=> "false", :vulgar=> "false", :give_out=> "false")
    else
      flash[:error] = configatron.bad_website
    end
    @user = @whymail.user
    
    respond_to do |format|
      format.html # new.html.erb
  #    format.xml  { render :xml => @portfolio }
      format.js {render :partial => 'new'}
    end
    
    
  end



  def create
    whymail_id = params[:whymail]
    if current_user
      whymail = Whymail.find(:first, :include => :user, :conditions => ["id = ?", whymail_id])
      @website = whymail.website
      website = Website.find(:first, :conditions => ["url = ?", @website])||Website.create(:url => @website, :grade => 'NA', :rank => 100)
      #Website.create(:url => whymail.website, :grade => 'NA', :rank => 100)
      if params[:survey] != nil
        survey = website.surveys.create(params[:survey])
        survey.user = current_user
        survey.save
      end
     # whymail.email = nil
      whymail.destroy if whymail.user == current_user
      render :text => "Thank you for using WhySpam.me You may now close this popup. <br />"
    else
    render :text => "Wrong User"
    end
  end
  
  

end