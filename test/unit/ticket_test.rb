require 'test_helper'

class TicketTest < ActiveSupport::TestCase
  # Replace this with your real tests.

#  validates_uniqueness_of   :to_email, :scope => [:body, :from_email]
#  validates_presence_of     :to_email
# validates_presence_of     :from_email

  def test_unique_email
    ticket = Ticket.create(:from_email => "example@example.com", :to_email => "foo@example.com", :body => "hey there")
    ticket = Ticket.create(:from_email => "example@example.com", :to_email => "foo@example.com", :body => "hey there")
    assert !ticket.valid?
    assert ticket.errors.on(:to_email)
  end
  
  def test_from_email_presence
    ticket = Ticket.create(:to_email => "foo@example.com", :body => "hey there")
    assert !ticket.valid?
    assert ticket.errors.on(:from_email)
  end  

  def test_to_email_presence
    ticket = Ticket.create(:from_email => "foo@example.com", :body => "hey there")
    assert !ticket.valid?
    assert ticket.errors.on(:to_email)
  end  
  



end
