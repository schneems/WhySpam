# class UsedWhyMails < ActiveRecord::Migration
#   def self.up
#     create_table :usedwhymail do |t|
#       t.string :website, :email, :main_url
#       t.integer :user_id
#       t.timestamps
#     end
#     
#     add_index :whymail, :email
#     add_index :usedwhymail,  :email
#   end
# 
#   def self.down
#     drop_table :usedwhymail
#     remove_index :whymail, :email
#     remove_index :usedwhymail, :email
#   end
# end
