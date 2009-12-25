class AddUniqueIndex < ActiveRecord::Migration
  def self.up
    add_column :tickets, :body_hash, :string
    add_index( :tickets, [:to_email, :body_hash, :from_email] , :unique => true, :limit => 255)
    
#    add_index( :tickets, [:to_email, :body, :from_email ] , :unique => true, :limit => 255 )
  end

  def self.down
      remove_column :tickets, :body_hash
    remove_index :tickets, [:to_email, :body_hash, :from_email ]
  end
end
