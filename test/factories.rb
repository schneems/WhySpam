gem 'thoughtbot-factory_girl'
require 'factory_girl'

Factory.define :website do |f|
  f.sequence(:url) { |n| "www.example#{n}.com"}
  f.grade "A+"
  f.rank 100
end


# Factory(:bad_survey)





Factory.define :survey do |f|
  f.opt_out "false"
  f.un_solicited "false"
  f.sell "false"
  f.vulgar "false"
  f.give_out "false"
  f.association :email, :factory => :whymail
  f.association :website, :factory => :website
  f.association :user, :factory => :user
  
end

Factory.define :bad_survey, :parent => :survey do |f|
  f.association :email, :factory => :whymail
  f.association :website, :factory => :website
  f.opt_out "true"
  f.un_solicited "true"
  f.sell "true"
  f.vulgar "true"
  f.give_out "false"
end


Factory.define :ticket do |f|
  f.sequence(:from_email) {|n| "foo#{n}@example.com"}
  f.sequence(:to_email) {|n| "foo#{n}@example.com"}
  f.body "Hey there number  how are you"
  f.subject "Dis is a subject"
end


Factory.define :user do |f|
  f.sequence(:login) {|n| "foo_users#{n}"}
  f.email {|u| u.login + "@example.com"}
  f.password {|u| u.email }
  f.password_confirmation {|u| u.password}
end

# Factory.create
# Factory.build won't save to database
# Factory.attributes_for
# Factory() is the same as factory.create

Factory.define :forms do |f|
  f.sequence(:email) {|n| 'foo#' + n.to_s + '@example.com'}
  f.sequence(:address) {|n| 'abcd'+n.to_s}
end



Factory.define :whymail do |f|
  f.sequence(:email) {|n| '41CCA8EB1369A18DCDf'+n.to_s+'@WHYSPAM.ME'}
  f.association :user
end