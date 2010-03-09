class CreateDictionaries < ActiveRecord::Migration
  def self.up
    create_table :dictionaries do |t|
      t.string :word
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :dictionaries
  end
end
