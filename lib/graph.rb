module Graph
  ##   http://dynamic.boingboing.net/cgi-bin/mt/mt-cp.cgi?__mode=register&blog_id=1&return_to=http%3A%2F%2Fboingboing.net%2F
  

  
  def graphArray(graph_hash = { })
    klass = graph_hash[:class].camelize.constantize 
    months = graph_hash[:months] || 0
    days = graph_hash[:day] || 0
    elapsed_time = months.month + days.day
    found_objects = klass.find(:all, :conditions => [ "created_at > ?",  (Time.now.end_of_day - elapsed_time) ],:order => 'created_at DESC')

    
    days = elapsed_time.to_i/60/60/24
    
    output_array = Array.new(days, 0)
    date_array = []
    0.upto(days-1) do |date|     
      date_array[date] = Time.now.end_of_day - date.days if date_array[date].nil?                                           
    end
    
    
    found_objects.each do |object|
        0.upto(days-1) do |date|     
          if object.created_at > (Time.now.end_of_day - (date+1).days) && object.created_at < (Time.now.end_of_day - date.days)
            output_array[date] =  output_array[date] + 1
            break
          end              
        end
     end     
     count = 0
     output_array.each{|item| count += item.to_i }
     month_data = {:date_array => date_array.reverse!, :array => output_array.reverse!, :count => count }
    return month_data
  end
  
  
  def format_highchart(graph_hash = { })
    month_data = graphArray(graph_hash)
    highchart_array = []

      0.upto((month_data[:date_array].size) - 1) do |count|
        year =  month_data[:date_array][count].strftime("%Y")
        month = month_data[:date_array][count].strftime("%m").to_i - 1
        month = month.to_s
        day = month_data[:date_array][count].strftime("%d")    
        highchart_array << ["Date.UTC(#{year}, #{month}, #{day})", month_data[:array][count] ]
      end
      return highchart_array
  end
  
  
    def find_from_url(address)
      if !address.nil?
        address = address.gsub(/@/, '-AT-') ## removes www
        address = address.gsub(/[.]/, '-DOT-') ## removes www
    #    address = /\@(.)+/.match(address)[0]
    #    address = address[1,address.size]    
      end
      return address
    end


    def clean_url(url)
      if !url.nil?
         url = url.gsub(/w{3}\./, '') ## removes www
         url = url.gsub(/^https\:\/\/|^http\:\/\//, '') 
         # url = /[\d\D]+\//.match(url)[0] if ! /[\d\D]+\//.match(url).nil?  ## pulls out asdlfkjsdlkfj/
         url = /^[^\/]+/.match(url)[0] if ! /^[^\/]+/.match(url).nil? 
         url = url.gsub(/\/$/, '') ## removes trailing slash if there is one
      end
         return url
    end


  end