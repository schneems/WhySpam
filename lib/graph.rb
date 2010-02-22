module Graph
  ##   http://dynamic.boingboing.net/cgi-bin/mt/mt-cp.cgi?__mode=register&blog_id=1&return_to=http%3A%2F%2Fboingboing.net%2F
  

  def getModelArray(days, graph_hash = {})
    elapsed_time = days *60*60*24     
    klass = graph_hash[:class].camelize.constantize 
    found_objects = klass.find(:all, :conditions => [ "created_at > ?",  (Time.now.end_of_day - elapsed_time) ],:order => 'created_at DESC')
    return found_objects
  end
  
  
  def getDateTimeArray(days)
    dateArray = []
    0.upto(days-1) do |date|     
      dateArray[date] = Time.now.end_of_day - date.days if dateArray[date].nil?                                           
    end
    return dateArray.reverse!
  end
  
  def getModelCountArray(found_objects, days)
     output_array = Array.new(days, 0)  
      found_objects.each do |object|
          0.upto(days-1) do |date|     
            if object.created_at > (Time.now.end_of_day - (date+1).days) && object.created_at < (Time.now.end_of_day - date.days)
              output_array[date] =  output_array[date] + 1
              break
            end              
          end
      end
      date_array = getDateTimeArray(days)
    return  output_array.reverse!
  end
  
    def getDays(graph_hash = {})
        months = graph_hash[:months] || 0
        days = graph_hash[:days] || 0
        elapsed_time = months.month + days.day
        days = elapsed_time.to_i/60/60/24 
             
      return days
    end
  
  
  #  def removeValues()
  #    ## section removes all values that equal a certain number such as zeroes.
  #    if !graph_hash[:removeValue].nil?
  #      output_array.each_index do |index| 
  #        if output_array[index] == graph_hash[:removeValue].to_i
  #          output_array[index] = nil
  #          date_array[index] = nil
  #        end         
  #      end
  #    end
  #  end
  
    def getTotalCount(output_array)
      count = 0
      output_array.each{|item| count += item.to_i }
      return count
    end
  
    def getDateAndData(graph_hash = { })
      days = getDays(graph_hash)
      found_objects = getModelArray(days, graph_hash) 
      output_array = getModelCountArray(found_objects, days)
      date_array = getDateTimeArray(days)
      count = getTotalCount(output_array)
      
      month_data = {:date_array => date_array.compact, :array => output_array.compact, :count => count }
      return month_data
    end
  
  
    def format_highchart(graph_hash = { })
      month_data = getDateAndData(graph_hash)
      highchart_array = []
    
        0.upto((month_data[:date_array].size) - 1) do |count|
          year =  month_data[:date_array][count].strftime("%Y")
          month = month_data[:date_array][count].strftime("%m").to_i - 1
          month = month.to_s
          day = month_data[:date_array][count].strftime("%d")    
          highchart_array << ["Date.UTC(#{year}, #{month}, #{day})", month_data[:array][count] ]
        end
      
        highchart_hash = {:data => highchart_array, :count => month_data[:count]}
        return highchart_hash
    end
  
  end
  
  # output_array.collect!{|item| item == 0 ? nil : item }
  
  
  
  #  output_array = []
  #  
  #  offset = days
  #  
  #  found_objects.each do |object|
  #    index = object.created_at.day + offset
  #    output_array[index].nil? ? output_array[index] = 1 : output_array[index] +=  1
  #    
  #    puts object.created_at.day
  #  end
  #  

  #  
  #  days.downto(0) do |date|
  #    date_array[date]  
  #  end