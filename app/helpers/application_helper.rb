# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def format_for_highchart()
    
  end
  
  def format_dates_for_array(date_array)
    final_array = []
    date_array.each do |date|
      final_array << day_of_the_week(date).to_s
    end
    return final_array
  end
  
  def jsyear_month_day(date)
   year =  date.strftime("%Y")
   month = date.strftime("%m").to_i - 1
   month = month.to_s
   day = date.strftime("%d")    
      return year + ',' + month + ',' + day + '<br />'
  end
  
  #  day = case day_num
  #  when "0" then "Sunday"
  #  when "1" then "Monday"
  #  when "2" then "Tuesday"
  #  when "3" then "Wednesday"
  #  when "4" then "Thursday"
  #  when "5" then "Friday"
  #  when "6" then "Saturday"
  #  else ""
  #  end
  # year, month - 1, day
  
  def clean_url(url)
       url = url.gsub(/w{3}\./, '') ## removes www
       url = url.gsub(/^https\:\/\/|^http\:\/\//, '') 
       # url = /[\d\D]+\//.match(url)[0] if ! /[\d\D]+\//.match(url).nil?  ## pulls out asdlfkjsdlkfj/
       url = /^[^\/]+/.match(url)[0] if ! /^[^\/]+/.match(url).nil? 
       url = url.gsub(/\/$/, '') ## removes trailing slash if there is one
       return url
  end
  
  
  def section_link(name,options)

      if (options[:action] == params[:action] and options[:controller] == params[:controller] ) || url_for(:controller => params[:controller], :action => params[:action]) == options
         link_to(image_tag(name+".png"), options, :class => 'on')
      else
         link_to(image_tag(name+".png"),options, :class => 'nav-button')
      end
  end
  
  class ActionView::Helpers::FormBuilder
    
    
    def button_with_icon(text , icon)
      object_name = self.object_name
      
      #return self.submit "<span class='ui-icon'></span>#{text}" , :class => "ui-corner-all ui-state-default"
      # return "<a href = \"#\" onclick =\"$('#new_user').submit();\" type='submit' name='commit' id='#{object_name}_submit' class = 'ui-corner-all fg-button ui-state-default fg-button-icon-left'><span class='ui-icon ui-icon-#{icon}'></span>#{text}</a>"
      return "<button id='#{object_name}_submit' class = 'ui-corner-all fg-button ui-state-default fg-button-icon-left' type='submit' name='commit'> &nbsp <span class='ui-icon ui-icon-#{icon}'></span>#{text}</button>"
      
      ## don't remove the &nbsp for fear of deat (from IE)
    end
    
    
    def default_text_field(name, value)   
      
      if object[name].nil?
      text_field(name, :value => value,  :class => "gray-input", :onfocus => "if (this.value=='#{value}') this.value = '';this.style.color = 'black';", :onblur => "if (this.value=='') {this.value = '#{value}';this.style.color = '';}" )
      else
        value = object[name] 
        text_field(name, :value => value)
      end
      
    end
  
    def default_text_area(name, value)
      if object[name].nil?
          text_area(name, :value => value,  :class => "gray-input", :onfocus => "if (this.value=='#{value}') this.value = '';this.style.color = 'black';", :onblur => "if (this.value=='') {this.value = '#{value}';this.style.color = '';}" )    
      else
        value = object[name] 
        text_area(name, :value => value )    
      end
    end
  end
  
  def button_with_icon(text , icon)
    return "<button id='foo_submit' class = 'ui-corner-all fg-button ui-state-default fg-button-icon-left' type='submit' name='commit'><span class='ui-icon ui-icon-#{icon}'></span>#{text}</button>"
  end
  
  def default_text_field_tag(name, value)
    text_field_tag(name, value,  {:class => "gray-input", :onfocus => "if (this.value=='#{value}') this.value = '';this.style.color = 'black';", :onblur => "if (this.value=='') {this.value = '#{value}';this.style.color = '';}"} )
  end
  
  
  
end
