class ExtendDictionary < ActiveRecord::Migration
  def self.up
    add_column :dictionaries, :category, :string
    add_column :dictionaries, :length, :integer
    
  end

  def self.down
    remove_column :dictionaries, :category
    remove_column :dictionaries, :length
    
  end
end
