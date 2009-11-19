class SlopboxController < ApplicationController
  layout "application", :except => [:spam_survey, :report_spam, :test, :ie, :ie2, :test2, :HEY, :optional]
  
  
   def show
        flash[:error] = ""
        #  @ticket = Ticket.first
        
        #@ticket = Ticket.new(:to_email => @to_email)       
          if simple_captcha_valid?
            @to_email = params[:ticket][:to_email] 
            
            email_length = @to_email.scan(/[\w.]+@/)[0].to_s.size           
            @tickets = Ticket.find(:all, :conditions => ["to_email = ?", @to_email])
            whymail = Whymail.find(:first, :conditions => ["email = ?", @to_email])
              if !@tickets.first.nil? and email_length != 21 and whymail == nil
                @tickets = @tickets
                flash[:notice] = "You've got mail"
              else 
                flash[:error]  += "- We haven't received any email at this email address, please try again later. <br />" if @tickets.first.nil?
                flash[:error]  += "- This is an address that may be used by a WhySpam Disposable Email in the future, <br /> to ensure that you never pick a WhySpam Secure email by accident, always pick a url that does not equal 20 characters such as:  1#{@to_email}<br />" if email_length == 21 
                redirect_to :action => :index
              end
            else
              flash[:error]  += "- The Text from the Image did not Match the text, please try again <br />"
              redirect_to :action => :index
          end
        # flash[:error]  += "- This email is being used by a WhySpam Disposable Email.<br />" if whymail != nil
        
         flash[:error] = nil if flash[:error].strip.empty?
   end
   
   
   
end
