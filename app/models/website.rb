class Website < ActiveRecord::Base
  has_many :surveys
  validates_presence_of     :url
  validates_presence_of     :grade
  
  
   attr_accessible :url, :grade, :rank, :opt_out_count, :un_solicited_count, :sell_count, :vulgar_count, :give_out_count
  
  def populate_count_and_rank
    self.populate_website_counts_from_surveys
    self.calculate_rank_and_grade
    self.save
  end
  
  
  
  def self.find_or_create_by_url(url)
    url = Cleanurl.sanatize(url)
    self.find_by_url(url)||self.create(:url => url, :rank => 0, :opt_out_count => 0, 
                                       :un_solicited_count => 0, :sell_count => 0, 
                                       :vulgar_count => 0, :grade => "N/A")
  end
  
  
  def populate_website_counts_from_surveys
    ## yes inject is slower, but this code is prettier than the .each alternative
    opt_out_sum = un_solicited_sum = sell_sum = vulgar_sum = 0
    self.surveys.each {|i| opt_out_sum += 1 if i.opt_out == "true" }
    self.opt_out_count = opt_out_sum    
    self.surveys.each {|i| un_solicited_sum += 1 if i.un_solicited == "true" }
    self.un_solicited_count = un_solicited_sum
    self.surveys.each {|i| sell_sum += 1 if i.sell == "true" }
    self.sell_count = sell_sum
    self.surveys.each {|i| vulgar_sum += 1 if i.vulgar == "true" }
    self.vulgar_count = vulgar_sum   
  end
  
  
  ## assume no survey is saved that has opt_out = true
  ## This method will never be called unless from a survey :after_save callback
  ## websites must be initalized with zeros


  def calculate_rank_and_grade    
    points_off = 0
    points_off += self.opt_out_count * 5         
    points_off += self.un_solicited_count * 10   
    points_off += self.sell_count * 21           
    points_off += self.vulgar_count * 31        
    points_off = points_off/(self.surveys.count) 
    result = case rank = 100 - points_off
       when 96..500 then "A+"
       when 90..95 then "A-"
       when 80..89 then "B"
       when 70..79 then "C"
       when 60..69 then "D"
       when 0..60 then "F"
    end
    self.grade = result
    self.rank = rank
  end
  
end
