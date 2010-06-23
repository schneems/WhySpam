class CreateAddWhymailIdIndexToTickets < ActiveRecord::Migration
  def self.up
    add_index(:tickets, :whymail_id)
  end

  def self.down
    remove_index(:tickets, :whymail_id)
  end
end
