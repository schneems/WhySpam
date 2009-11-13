class ZtestController < ApplicationController
  
  def form_test
    user = User.find_or_create_by_email("Blah@blah.com")
  end
end
