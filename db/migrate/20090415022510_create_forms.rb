class CreateForms < ActiveRecord::Migration
  def self.up
    create_table :forms do |t|
      t.text :comments
      t.string :email
      t.integer :days
      t.string :crypt_form
      t.integer :user_id
      t.timestamps
    end
  end

  def self.down
    drop_table :forms
  end
end
