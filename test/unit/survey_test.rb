require 'test_helper'

class SurveyTest < ActiveSupport::TestCase
  # Replace this with your real tests.


  def test_presence_of
     survey = Survey.new
     assert !survey.valid?
     
     survey = Survey.create(:opt_out => nil,:un_solicited => "", :sell => "", :vulgar => "", :give_out => "", :email => "", :website_id => 1 )
     assert !survey.valid?
     assert survey.errors.on(:opt_out)    
     survey = Survey.create(:opt_out => "",:un_solicited => nil, :sell => "", :vulgar => "", :give_out => "", :email => "", :website_id => 1 )
     assert !survey.valid?
     assert survey.errors.on(:un_solicited)     
     survey = Survey.create(:opt_out => "",:un_solicited => "", :sell => nil, :vulgar => "", :give_out => "", :email => "", :website_id => 1 )
     assert !survey.valid?
     assert survey.errors.on(:sell)
     survey = Survey.create(:opt_out => "",:un_solicited => "", :sell => "", :vulgar => nil, :give_out => "", :email => "", :website_id => 1 )
     assert !survey.valid?
     assert survey.errors.on(:vulgar)
     survey = Survey.create(:opt_out => "",:un_solicited => "", :sell => "", :vulgar => "", :give_out => nil, :email => "", :website_id => 1 )
     assert !survey.valid?
     assert survey.errors.on(:give_out)
     survey = Survey.create(:opt_out => "",:un_solicited => "", :sell => "", :vulgar => "", :give_out => "", :email => nil, :website_id => 1 )
     assert !survey.valid?
     assert survey.errors.on(:email)
     survey = Survey.create(:opt_out => "",:un_solicited => "", :sell => "", :vulgar => "", :give_out => "", :email => "", :website_id => nil )
     assert !survey.valid?
     assert survey.errors.on(:website_id)
  #  validates_presence_of     :opt_out
  #  validates_presence_of     :un_solicited
  #  validates_presence_of     :sell
  #  validates_presence_of     :vulgar
  #  validates_presence_of     :give_out
  #  validates_presence_of     :email
  #  validates_presence_of     :website_id
  end

end
