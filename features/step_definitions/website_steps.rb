Given /^I have a websites that is populated with surveys$/ do
  w = Factory(:website)
  
  survey = Factory(:bad_survey, :website => w)
  w = Website.find(:first, :conditions => ["id = ? ", w])
  survey = Factory(:survey)
  
  
 # assert_equal w.opt_out_count , 1
 # assert_equal w.un_solicited_count, 1
 # assert_equal w.sell_count, 1
 # assert_equal w.vulgar_count, 1
 # assert_equal w.give_out_count, 0
  
end