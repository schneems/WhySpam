require 'test_helper'

class FormsTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  
  
  
  def test_create_with_cryptform
      f = Forms.create_with_cryptform("bobs@bob.com", "hey you guys")
      assert_equal(f.email, "bobs@bob.com")
      f = Forms.create_with_cryptform("bobs", "hey you guys")
      assert_equal(f.valid?, false )
      f = Forms.create_with_cryptform("bobs", "")
      assert_equal(f.valid?, false )
  end
  

  def test_presence_of_email
    form = Forms.new
    assert !form.valid?
    assert form.errors.invalid?(:email)
  end
  
  
  def test_validates_format_of_email
    form = Forms.create(:email => "abcdef@asdf.com")
    assert form.valid?
    form = Forms.create(:email => "@asdf.com")
    assert_equal "should look like an email address.", form.errors.on(:email)
    form = Forms.create(:email => "asdf@.com")
    assert !form.errors.on(:email)
    assert_equal "should look like an email address.", form.errors.on(:email)
    form = Forms.create(:email => "asdf@aasdf")
    assert !form.errors.on(:email)
    assert_equal "should look like an email address.", form.errors.on(:email)
  end
   
  
  test "the truth" do
    assert true
  end
end
