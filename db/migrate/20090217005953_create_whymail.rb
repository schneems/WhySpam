class CreateWhymail < ActiveRecord::Migration
  def self.up
    create_table :whymail do |t|
      t.string :website, :email, :main_url
      t.integer :user_id
      t.timestamps
    end
  end

  def self.down
    drop_table :whymail
  end
end
