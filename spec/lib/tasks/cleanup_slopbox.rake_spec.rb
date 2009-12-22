require File.expand_path(File.dirname(__FILE__) + '../../../spec_helper')
require "rake"


describe "cleanup rake" do 
  before do
    @rake = Rake::Application.new
    Rake.application = @rake
    Rake.application.rake_require "lib/tasks/cleanup"
    Rake::Task.define_task(:environment)
  end
  
  describe "cleanup" do
    it "should clean out slop box over 24 hours old" do
      Factory.create(:ticket, :whymail_id => nil, :created_at =>  Time.now-26.hours )      
      Ticket.count.should == 1           
      assert_difference "Ticket.count", -1 do       
        @task_name = "cleanup:slopbox"
        @rake[@task_name].invoke
      end
    end
    
       it "should not clean out tickets less than 24 hours old" do
        Factory.create(:ticket, :whymail_id => nil, :created_at => Time.now )
         Ticket.count.should == 1     
         assert_difference "Ticket.count", 0 do       
           @task_name = "cleanup:slopbox"
           @rake[@task_name].invoke
         end
       end
    
    
  end
  
end



