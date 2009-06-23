class AddTicketsToForms < ActiveRecord::Migration
  def self.up
    add_column :tickets, :form_id, :integer
    
  end

  def self.down
    remove_column :tickets, :form_id 
    
  end
end
