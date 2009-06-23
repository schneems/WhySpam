class Website < ActiveRecord::Base
  has_many :surveys
  
#  define_index do
#    # indexes ##column in content
#    indexes url
#    indexes surveys.comments as => surveys_comments
#  end
  
  
  
end
