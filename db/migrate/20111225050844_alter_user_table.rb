class AlterUserTable < ActiveRecord::Migration
  def self.up
    rename_column("users", "password", "hashed_password")
    add_column("users", "salt", :string, :limit => 40)
    add_index("users", "username")
  end

  def self.down
    remove_index("users", "username")
    remove_column("users", "salt")
    rename_column("users", "hashed_password", "password")
  end
end
