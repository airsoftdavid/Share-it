class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :contact
      t.integer :admin_id

      t.timestamps null: false
    end
    add_index :users, [:admin_id]
  end
end