class CreateFees < ActiveRecord::Migration
  def self.up
    create_table :fees do |t|
      t.integer :member_id
      t.date :from, :null => false
      t.date :to, :null => false
      t.integer :amount
      t.integer :advance, :default => 0
      t.integer :pending
      t.string :proprietor, :default => "jagan"

      t.timestamps
    end
  end

  def self.down
    drop_table :fees
  end
end
