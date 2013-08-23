class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.string :message
      t.belongs_to :friend
      t.belongs_to :user
      t.timestamps
    end
    add_index :tweets, [:friend_id, :user_id]
    
  end
end
