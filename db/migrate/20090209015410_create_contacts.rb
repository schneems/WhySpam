class CreateContacts < ActiveRecord::Migration
  def self.up
    create_table :contacts do |t|
   #   t.string :first_name, :last_name
      t.timestamps
    end
  end

  def self.down
    drop_table :contacts
  end
end