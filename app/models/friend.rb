class Friend < ActiveRecord::Base
  has_many :tweets
  
  belongs_to :user, foreign_key: :user_id, class_name: "User"

end



# class CreateFriends < ActiveRecord::Migration
#   def change
#     create_table :friends do |t|
#       t.string :username, null: false
#       t.belongs_to :user
#       t.timestamps
#     end
#   end
# end
