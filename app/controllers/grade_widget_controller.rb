
class GradeWidgetController < ApplicationController

  layout "application", :except => [:show, :spam_survey, :report_spam, :test, :ie, :ie2, :test2, :HEY, :optional]
  
  def validated
    render :partial => 'validated'
  end
  
  def checked
    render :partial => 'checked'
  end
  
  def new
  end

  
  ## http://localhost:3000/grade_widget/hey?checked=true
  def show
    @myurl = clean_url(params[:url])
    checked = params[:checked].downcase if params[:checked]
    @website = Website.find(:first, :conditions => ["url = ?", @myurl])
    if @website.nil? || checked == "true"
      @image = "widgets/checked.png"
    else
      case @website.grade.upcase
      when "A+"
        @image = "widgets/aplusvalid.png"
      when "A-"
        @image = "widgets/avalid.png"
      when "B"
        @image = "widgets/bvalid.png"
      when "C"
        @image = "widgets/cvalid.png"
      when "D"
        @image = "widgets/dvalid.png"
      when "F"
        @image = "widgets/fvalid.png"
      else              
        @image = "widgets/checked.png"
      end
    end ## if 
    render :partial => "show"
  end
  
  def create
    @website = clean_url(params[:website])
    displaytype = params[:displaytype]||"notchecked"
    @boolean = "false"
    @boolean = "true" if displaytype.downcase == "checked"
  end
  
  
  
end
