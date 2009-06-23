class Survey < ActiveRecord::Base
  belongs_to :user
  belongs_to :website
  
  # survey has one user
  
end
