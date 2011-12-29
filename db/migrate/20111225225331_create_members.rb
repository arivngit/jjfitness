class CreateMembers < ActiveRecord::Migration
  def self.up
    create_table :members do |t|
      t.integer :memership_number
      t.string :name, :default => "", :null => false
      t.integer :age
      t.string :blood_group
      t.string :profession
      t.text :address

      t.timestamps
    end
  end

  def self.down
    drop_table :members
  end
end
