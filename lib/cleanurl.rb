module Cleanurl
##   http://dynamic.boingboing.net/cgi-bin/mt/mt-cp.cgi?__mode=register&blog_id=1&return_to=http%3A%2F%2Fboingboing.net%2F
  def find_from_url(address)
    if !address.nil?
      address = address.gsub(/@/, '-AT-') ## removes www
      address = address.gsub(/[.]/, '-DOT-') ## removes www
  #    address = /\@(.)+/.match(address)[0]
  #    address = address[1,address.size]    
    end
    return address
  end


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