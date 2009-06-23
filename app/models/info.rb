class Info < ActiveRecord::Base
  belongs_to :user
  has_many :tickets
    
    named_scope :cryptmail, lambda { |*args| {:conditions => ["cryptmail = ?", args.first.downcase]} }
    
    #   Info.cryptmail("A527827171573EB1FD1125337E1DF725D53DAB37")
end
