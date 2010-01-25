class Survey < ActiveRecord::Base
  belongs_to :user
  belongs_to :website
  after_save :add_up_surveys
  attr_accessible :opt_out, :un_solicited, :sell, :vulgar, :give_out, :email, :comments
  validate :check_give_out

  def check_give_out
    if self.give_out == "true"
      self.errors.add("we do not record surveys if you gave out the email to more than one website")
     # self.delete
    end
  end

  def add_up_surveys
      website = self.website
      website.populate_count_and_rank
  end
end
