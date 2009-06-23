class CreateMailmen < ActiveRecord::Migration
  def self.up
    create_table :mailmen do |t|
      t.timestamps
    end
  end

  def self.down
    drop_table :mailmen
  end
end
