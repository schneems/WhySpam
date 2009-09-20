class GradeWidgetController < ApplicationController
  layout "users", :except => [:show, :spam_survey, :report_spam, :test, :ie, :ie2, :test2, :HEY, :optional]
  
  ## whyratingAplus
  ## whyratingAminus
  ## whyratingB
  ## whyratingC
  ## whyratingD
  ## whyratingF
  ## whyratingchecked
  
  def validated
    
    render :partial => 'validated'
  end
  
  def checked
    render :partial => 'checked'
    
  end
  
  def index
    
  end

  
  ## http://localhost:3000/grade_widget/hey?checked=true
  def show
    @myurl = params[:url]
    checked = params[:checked].downcase if params[:checked]
    @website = Website.find(:first, :conditions => ["url = ?", @myurl])
    if @website.nil? || checked == "true"
      @image = "whyratingchecked.png"
    else
      case @website.grade.upcase
      when "A+"
        @image = "whyratingAplus.png"
      when "A-"
        @image = "whyratingAminus.png"
      when "B"
        @image = "whyratingB.png"
      when "C"
        @image = "whyratingC.png"
      when "D"
        @image = "whyratingD.png"
      when "F"
        @image = "whyratingF.png"
      else              
        @image = "whyratingchecked.png"
      end
    end ## if 
    render :partial => "show"
  end
  
  def create
    @website = params[:website]
    displaytype = params[:displaytype]||"true"
    @boolean = "false"
    @boolean = "true" if displaytype.downcase == "checked"
  end
  
  
  
end
