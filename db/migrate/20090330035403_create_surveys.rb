class CreateSurveys < ActiveRecord::Migration
  def self.up
    create_table :surveys do |t|
      t.string :opt_out, :un_solicited, :sell, :vulgar, :give_out, :cryptmail
      t.text :comments
      t.integer :website_id, :user_id
      t.timestamps
    end
  end

  def self.down
    drop_table :surveys
  end
end
