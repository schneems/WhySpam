class CreateTickets < ActiveRecord::Migration
  def self.up
    create_table :tickets do |t|
      t.text :from_email, :ticket_collaterals, :to_email, :body
      t.string :subject
      t.string :status
      t.integer :whymail_id
      
    #  add_column :tickets, :subject, :string
    #  add_column :tickets, :body, :text
      t.timestamps
    end
  end

  def self.down
    drop_table :tickets
  end
end
