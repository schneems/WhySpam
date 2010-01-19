class Survey < ActiveRecord::Base
  belongs_to :user
  belongs_to :website
  
  
  attr_accessible :opt_out, :un_solicited, :sell, :vulgar, :give_out, :email
  
  
 # validates_presence_of     :opt_out
 # validates_presence_of     :un_solicited
 # validates_presence_of     :sell
 # validates_presence_of     :vulgar
 # validates_presence_of     :give_out
 # validates_presence_of     :email
 # validates_presence_of     :website_id
  
  
  def after_create
    model = self
    model.add_up_surveys
  #  Notifications.deliver_comment("admin@do.com", "New comment was posted", comment)
  end
  

  def add_up_surveys
    
  survey = self
  website = Website.find(:first, :include => :surveys, :conditions => ["id = ?", survey.website_id])  
  current_rank = website.rank || 100
  website.opt_out_count ||= 0

  
  website.un_solicited_count ||= 0
  website.sell_count ||= 0
  website.vulgar_count ||= 0
  website.give_out_count ||= 0
  ## keep track of all surveys that haven't been given out to other websites
  if survey.give_out != "true"
      website.opt_out_count += 1 if survey.opt_out == "true"
      website.un_solicited_count += 1 if survey.un_solicited == "true"
      website.sell_count += 1 if survey.sell == "true"
      website.vulgar_count += 1 if survey.vulgar == "true"
      website.give_out_count = 0 if website.give_out_count.nil?
  else
      website.give_out_count += 1
  end
  
  website.save
  website.calculate_rank_and_grade
  


end


  
end
