require 'test_helper'

class InfoTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  
  def test_validates_presence_of_cryptmail
    info = Info.new
    assert !info.valid?
    assert info.errors.on(:cryptmail)
    
  end
  
  def test_uniqueness_presence_of_cryptmail
    info = Info.create(:cryptmail => "1234")
    info = Info.create(:cryptmail => "1234")
    assert !info.valid?
    assert info.errors.on(:cryptmail)    
  end 

end
