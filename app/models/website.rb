class Website < ActiveRecord::Base
  has_many :surveys
  validates_presence_of     :url
  validates_presence_of     :grade
  validates_presence_of     :rank
  
  
   attr_accessible :url, :grade, :rank, :opt_out_count, :un_solicited_count, :sell_count, :vulgar_count, :give_out_count
  
#  define_index do
#    # indexes ##column in content
#    indexes url
#    indexes surveys.comments as => surveys_comments
#  end
  
  def calculate_rank_and_grade
    
    website = self
  #  if !website.surveys.nil? && !website.surveys.empty? 
  #    survey_count = website.surveys.count 
  #    website_give_out = website.give_out_count || 
  #  else
  #    survey_count = 1
  #    website_give_out = 0
  #  end
    
    points_off = 0
    points_off -= website.opt_out_count * 5         if !website.opt_out_count.nil?
    points_off -= website.un_solicited_count * 10   if !website.un_solicited_count.nil?
    points_off -= website.sell_count * 20           if !website.sell_count.nil?
    points_off -= website.vulgar_count * 30         if !website.vulgar_count.nil?
    
    if (( website.surveys.count - website.give_out_count) ==0 ) || (!website.surveys.nil? && !website.surveys.empty? )
      average_points_off = points_off
      
    else
      average_points_off = points_off/(website.surveys.count - website.give_out_count)
      
    end
    rank = 100 + average_points_off
    
    result = case rank
       when 95..101 then "A+"
       when 90..94 then "A-"
       when 80..89 then "B"
       when 70..79 then "C"
       when 60..69 then "D"
       when 0..60 then "F"
    end
    
    website.grade = result
    website.rank = rank
    website.save
    
    

    
  end
  
end
