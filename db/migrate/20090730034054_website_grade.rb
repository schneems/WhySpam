class WebsiteGrade < ActiveRecord::Migration
  def self.up 
    add_column :websites, :grade, :string
    add_column :websites, :rank,  :integer
    add_column :websites, :opt_out_count, :integer
    add_column :websites, :un_solicited_count,  :integer
    add_column :websites, :sell_count, :integer
    add_column :websites, :vulgar_count, :integer
    add_column :websites, :give_out_count, :integer
    
  end

  def self.down
    remove_column :websites, :grade 
    remove_column :websites, :rank 
    remove_column :websites, :opt_out_count 
    remove_column :websites, :un_solicited_count 
    remove_column :websites, :sell_count 
    remove_column :websites, :vulgar_count 
    remove_column :websites, :give_out_count     
  end
end
