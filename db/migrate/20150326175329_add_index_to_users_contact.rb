class AddIndexToUsersContact < ActiveRecord::Migration
  def change
  	add_index :users, :contact, unique: true
  end
end
