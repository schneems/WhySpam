class SaveEmailToTicket < ActiveRecord::Migration
  def self.up
    add_column :tickets, :email, :string
    
  end

  def self.down
    remove_column :tickets, :email
    
  end
end



