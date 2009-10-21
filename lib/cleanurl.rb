module Cleanurl

  def clean_url(url)
    if !url.nil?
       url = url.gsub(/w{3}\./, '') ## removes www
       url = url.gsub(/^https\:\/\/|^http\:\/\//, '') 
       # url = /[\d\D]+\//.match(url)[0] if ! /[\d\D]+\//.match(url).nil?  ## pulls out asdlfkjsdlkfj/
       url = /^[^\/]+/.match(url)[0] if ! /^[^\/]+/.match(url).nil? 
       url = url.gsub(/\/$/, '') ## removes trailing slash if there is one
    end
       return url
  end


end