module Graph
  
  
  def format_highchart(graph_hash = { }) ## high level call, takes in has of class and date returns formatted hash:class => "User", :months => 1
    
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
  
  
  
  def getDateAndData(graph_hash = { }) ## returns array of dates, array of counted objects, and sum of the count
    days = getDays(graph_hash)
    # how do we know the cache is up to date? 
    # implement, last updated token, probably the easiest
    
    
    
    # if cache_is_up_to_date(graph_hash)
      # return cache 
        ## pull last date / count pair, and 
      # else populate cache 
    # end
    
    
    found_objects = getModelArray(days, graph_hash) 
    output_array = getModelCountArray(found_objects, days)
    date_array = getDateTimeArray(days)
    count = getTotalCount(output_array)
    month_data = {:date_array => date_array.compact, :array => output_array.compact, :count => count }    
    return month_data
  end
    
 # cache_graph_data(:hello, "blah")
 # p get_graph_data(:hello)
 # p delete_graph_data(:hello)
  
  @@default_pstore_name = "graph_data.pstore"
  
  

  
  
  
  

  

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
  
  
    def getTotalCount(output_array)
      count = 0
      output_array.each{|item| count += item.to_i }
      return count
    end
  
  
  
  # def pcach_is_current?( input )
  #   key = input[:class]
  #   data = pget_data(key)
  #   if data[:]
  #     
  #   end
  # end
  
     def pdelete_data(key, options = {} )
        store = options[:name].blank? ?  PStore.new(@@default_pstore_name) : PStore.new(options[:name])
        store.transaction do 
             return store.delete(key.to_sym) || Exception.new("#{key} does not exist in PStore cache")
       end
     end
  
  
  
  
  
  
  def pcache_data(key, data, options = {} )
     store = options[:name].blank? ?  PStore.new(@@default_pstore_name) : PStore.new(options[:name])
     store.transaction do 
       store[key]  = data
    end
  end
  
  def pget_data(key, options = {} )
     store = options[:name].blank? ?  PStore.new(@@default_pstore_name) : PStore.new(options[:name])
     store.transaction do 
       return store[key] 
    end
  end




  

  
  end
  
