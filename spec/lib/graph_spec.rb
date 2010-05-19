


require File.expand_path(File.dirname(__FILE__) + '../../spec_helper')
include Graph

describe "Graph" do 
  
  describe "cache_graph_data" do
    # can take a different name
    it "should write data to pstore" do
      
      cache_graph_data(data)
    end
  end
  
  describe "getDateTimeArray" do
    it "should give me an array of dates and times" do
      days = getDays(:days => 1)
      days.should == 1
    end
  end
  
  
  
  describe "getDateTimeArray" do
    it "should give me an array of dates and times" do
      days = getDays(:days => 1)
      days.should == 1
    end
  end
  
  describe "getDateTimeArray" do
    it "should give me an array of dates and times" do
        date_array = getDateTimeArray(1)
        date_array.count.should == 1
        date_array.last.day.should == Time.now.day
    end
  end
  
  describe "getModelCountArray" do 
    
    it "should take in an array of objects and give me an array of the count of those objects against the date-array" do 
      Factory.create(:ticket)
      tickets = Ticket.find(:all)
      days = 1
      countArray = getModelCountArray(tickets, days)
      
      countArray.count.should == 1
      countArray.last.should == 1
    end
    
    it "should take in an array of objects and give me an array of the count of those objects against the date-array" do 
      Factory.create(:ticket, :created_at => Time.now - 1.day)
      Factory.create(:ticket, :created_at => Time.now - 1.day)
      tickets = Ticket.find(:all)
      days = 2
      countArray = getModelCountArray(tickets, days)
      countArray.count.should == 2
      countArray.first.should == 2
      countArray.last.should == 0
    end
  end

  
  
  describe "getDateTimeArray" do
    it "should give me an array of dates and times" do
        date_array = getDateTimeArray(1)
        date_array.count.should == 1
        date_array.last.day.should == Time.now.day
    end
    it "should give me an array of dates and times" do
        date_array = getDateTimeArray(2)
        date_array.count.should == 2
        date_array.last.day.should == Time.now.day
        date_array.first.day.should == (Time.now - 1.day).day
    end
  end
  
  
  describe "getModelArray" do
    it "should give me an array of items based on the incoming clas and the amount of time" do
       @ticket = Factory.create(:ticket)   
       days = 1    
       result = getModelArray(days, :class => "Ticket", :months => 1)       
       result.count.should == 1
       result.last.should == @ticket
      # false.should == true
    end
  end
  
end