class AddTicketsToForms < ActiveRecord::Migration
  def self.up
    add_column :tickets, :forms_id, :integer
    
  end

  def self.down
    remove_column :tickets, :forms_id 
    
  end
end
