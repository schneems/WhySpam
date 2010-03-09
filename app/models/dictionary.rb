class Dictionary < ActiveRecord::Base
  
  
  def self.build_shady(atAddress)    
    shadeVar = self.shady + atAddress
    if !Whymail.find_by_email(shadeVar).nil? 
      self.build_shady(atAddress)
    end    
    
    return shadeVar
  end
  
  
  
  def self.shady
    w1 = Dictionary.random(:category => "shady")
    w2 = Dictionary.random(:category => "shady")
    return w1.word + ["-", "_", "+"].sort_by {rand}.first + w2.word + ["-", "_", "+", ""].sort_by {rand}.first + rand(9999).to_s 
  end
  
  def self.random(options={})
 #   category = category||"generic"
    d =  Dictionary.find(:first, :order => "RAND()", :conditions => ["category = ? and length < ?", options[:category]||"generic"  , options[:length]||100])
    return d 
  end
  
  def self.create_address(atAddress, options={})
      word = Dictionary.random(options).word
      address = word + rand(999).to_s + atAddress
      address = address.upcase
      if Whymail.find_by_email(address).nil?
      else
        Dictionary.create_address
      end
      return address
  end
     
    
  
end
