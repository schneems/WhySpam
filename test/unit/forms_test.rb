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
  
  test "the truth" do
    assert true
  end
end
