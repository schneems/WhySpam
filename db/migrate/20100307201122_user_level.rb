class UserLevel < ActiveRecord::Migration
  def self.up
    add_column :users, :level, :string
    
  end

  def self.down
    remove_column :users, :level
  end
end
