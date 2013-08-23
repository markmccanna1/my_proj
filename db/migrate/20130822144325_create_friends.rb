class CreateFriends < ActiveRecord::Migration
  def change
    create_table :friends do |t|
      t.string :username, null: false
      t.integer :user_id, null: false
      t.timestamps
    end
    add_index :friends, :user_id
  end
end
