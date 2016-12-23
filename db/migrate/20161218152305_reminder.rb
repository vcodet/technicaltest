class Reminder < ActiveRecord::Migration

  def self.up
  	create_table :reminders do |t|
      t.belongs_to :customer, null: :false
      t.string :rule, null: false
      t.date :due_date, null: false
    end

  end

  def self.down
  end
end
