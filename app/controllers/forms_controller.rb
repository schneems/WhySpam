class FormsController < ApplicationController
  layout "application", :except => [:spam_survey, :report_spam, :test, :ie, :ie2, :test2, :HEY, :optional, :foreign_show]
  
  # Be sure to include AuthenticationSystem in Application Controller instead
  ## sudo god -c ./config/fetcher-daemon.god -D
  ## check for logged in and user before viewing mail and deleting !!
  
  
  def send_form
    flash[:error] = ""
    form_id = params[:form][:form_id]
    from_email = params[:form][:email]||" "
    message = params[:form][:comments]

    if simple_captcha_valid?
    #  render :text => "workz foo"
      session[:count] = 0 if RAILS_ENV == "development"
      session[:count] = session[:count]||0
      session[:count] += 1 
        if session[:count] > 10
          flash[:error]  += "- #{configatron.session_count_error} <br />"
        else
          if message == nil || message.strip.empty? 
            flash[:error] += "- #{configatron.no_message} <br />"
          else
          form = Forms.find(form_id)
          
          if !form.nil?
            flash[:notice] = configatron.form_send_success
            flash[:error] = nil
            MyMailer.deliver_forward_form(form_id, from_email, message)
          else
            flash[:error] = "-  #{configatron.invalid_form} <br />"
          end
          end
       end
    else
        flash[:error]  += "- #{configatron.bad_captcha} <br />"
    end
    
    redirect_to :action => "show", :id => form_id    
  end



  
  def show
    # zq
      @crypt = params[:id]
      form = Forms.find_by_crypt(@crypt)
      @form_data = form.first
      # localhost:3000/forms/show/ZQ
      respond_to do |format|
         format.html 
       #  format.js {render :partial => "test" }
      end
  end
  

  ##TODO get the partial out of forms/new
  
  def create
    email = params[:form][:email]||" "
    comments = params[:form][:comments]
  #  user = User.find_or_create_by_email(email)
  
    #@form = Forms.new(:email => email, :comments => comments)
    
    @rendered = true
    if simple_captcha_valid?
    @extra_message  = nil
    @secure_form = nil
    session[:count] = 0 if RAILS_ENV == "development"
      session[:count] = session[:count]||0
      session[:count] +=  1 
      
        if session[:count] > 10
          @extra_message = configatron.session_count_error
        else
        the_user = User.find_or_create_by_email(email)
        the_form  = the_user.forms.find(:first, :conditions => ["comments = ?", comments])
        
          if the_form == nil && the_user.valid?
            the_form = the_user.forms.create_with_cryptform(email, comments)
          else
            @extra_message = configatron.duplicate_email_forms if the_form != nil 
            @extra_message = configatron.bad_email if !the_user.valid?
          end ## if user_whymail == nil
       end
        @secure_form = "www.whyspam.me/forms/" + the_form.address if the_form != nil
        @address = the_form.address if the_form != nil
    else
      @extra_message = configatron.bad_captcha
    end    
    render :partial => "create" 
  end
  
  
  def destroy
    form_id = params[:id]
    form = Forms.find(:first, :include => :user, :conditions => ["id = ?", form_id])
    address = form.address
    
    if current_user
      form.destroy if form.user == current_user
      puts current_user
      flash[:notice] = "Form to #{forms_url} + '/'+ #{form.address} has been deleted"
    end #  if current_user    
 #   redirect_to :back
    redirect_to :action => 'new'
  end


 # def destroy
 #      form_id = params[:id]
 #       form = Forms.find(:first, :include => [:whymail => :user], :conditions => ["id = ?", form_id])
 #       whymail = form.whymail
 #       if current_user
 #         form.destroy if form.whymail.user == current_user
 #       end #  if current_user    
 #       redirect_to :back
 # end

  
  protected
  



end