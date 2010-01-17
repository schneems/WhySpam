class FormNames < ActiveRecord::Migration
  def self.up
    add_column :forms, :name, :string
    
  end

  def self.down
    remove_column :forms, :name
  end
  
  
end
