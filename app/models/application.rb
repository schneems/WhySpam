class Application < ActiveRecord::Base
  include Cleanurl
  include Fwdemail
  
  before_filter :set_abingo_identity
  
  protected
  def set_abingo_identity
    if (session[:abingo_identity])
      Abingo.identity = session[:abingo_identity]
    else
      session[:abingo_identity] = Abingo.identity = rand(10 ** 10).to_i
    end
  end
  
end