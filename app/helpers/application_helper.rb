# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  
  def clean_url(url)
       url = url.gsub(/w{3}\./, '') ## removes www
       url = url.gsub(/^https\:\/\/|^http\:\/\//, '') 
       # url = /[\d\D]+\//.match(url)[0] if ! /[\d\D]+\//.match(url).nil?  ## pulls out asdlfkjsdlkfj/
       url = /^[^\/]+/.match(url)[0] if ! /^[^\/]+/.match(url).nil? 
       url = url.gsub(/\/$/, '') ## removes trailing slash if there is one
       return url
  end
  
  
  def section_link(name,options)
   # puts "=================="
   # puts options
   # puts params[:controller]
   # puts params[:action]
   # puts url_for(:controller => params[:controller], :action => params[:action])
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
      return "<button id='#{object_name}_submit' class = 'ui-corner-all fg-button ui-state-default fg-button-icon-left' type='submit' name='commit'><span class='ui-icon ui-icon-#{icon}'></span>#{text}</button>"
    end
    
    
    def default_text_field(name, value)
      text_field(name, :value => value,  :class => "gray-input", :onfocus => "if (this.value=='#{value}') this.value = '';this.style.color = 'black';", :onblur => "if (this.value=='') {this.value = '#{value}';this.style.color = '';}" )
    end
  
    def default_text_area(name, value)
      text_area(name, :value => value,  :class => "gray-input", :onfocus => "if (this.value=='#{value}') this.value = '';this.style.color = 'black';", :onblur => "if (this.value=='') {this.value = '#{value}';this.style.color = '';}" )    
    end
  end
  
  def button_with_icon(text , icon)
    return "<button id='foo_submit' class = 'ui-corner-all fg-button ui-state-default fg-button-icon-left' type='submit' name='commit'><span class='ui-icon ui-icon-#{icon}'></span>#{text}</button>"
  end
  
  def default_text_field_tag(name, value)
    text_field_tag(name, value,  {:class => "gray-input", :onfocus => "if (this.value=='#{value}') this.value = '';this.style.color = 'black';", :onblur => "if (this.value=='') {this.value = '#{value}';this.style.color = '';}"} )
  end
  
  
  
end
