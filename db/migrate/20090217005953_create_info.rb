class CreateInfo < ActiveRecord::Migration
  def self.up
    create_table :info do |t|
      t.string :website, :cryptmail, :main_url
      t.integer :user_id
      t.timestamps
    end
  end

  def self.down
    drop_table :info
  end
end
