class ShadyemailSendController < ApplicationController
  
  layout nil
  
  def new
    id = params[:user][:id] unless params[:user].nil?
    whymail = params[:user][:whymail] unless params[:user].nil?
    @user = User.find(:first, :conditions => ["id = ?", id])
    @whymail = @user.whymail.find(:first, :conditions => ["email = ?", whymail]) unless @user.nil?
    render :partial => "new" 
  end
  
  def create
      user_id = params[:id] unless params[:user].nil?
      subject = params[:user][:subject].to_s  unless params[:user].nil?
      to = params[:user][:to].to_s unless params[:user].nil? 
      message = params[:user][:message].to_s unless params[:user].nil?    
      whymail = params[:whymail]
      
      @user = User.find(:first, :conditions => ["id = ?", user_id])||User.new
      @whymail = @user.whymail.find(:first, :conditions => ["email = ?", whymail])
      
    if simple_captcha_valid?
        if !@whymail.nil?
          MyMailer.deliver_shady(@whymail.email, to, subject, message)
        end
        
        render :partial => "create" 
    else
      @extra_message = "Please Re-Enter Text from the Image Below"
      @user[:subject] = subject
      @user[:message] = message
      @user[:to] = to
      render :partial => "new" 
    end
    
    
  end
  
end
