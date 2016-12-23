class Customer < ActiveRecord::Migration
  def self.up
  	create_table :customers, force: true do |t|
      t.string :estate_code, null: false
      t.string :society, null: false
    end

    add_index :customers, :estate_code, unique: true

    puts 'ran up method'
  end

  def self.down
  end
end
