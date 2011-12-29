class AddLastPaidToMembers < ActiveRecord::Migration
  def self.up
  	add_column("members","last_paid","date")
  end

  def self.down
  	remove_column("members","last_paid")
  end
end
