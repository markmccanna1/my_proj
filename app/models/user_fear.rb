class UserFear < ActiveRecord::Base 
  belongs_to :user
  belongs_to :fear

end


# class UserFears < ActiveRecord::Migration
#   def change
#     create_table :user_fears do |t|
#       t.belongs_to :user
#       t.belongs_to :fear
#       t.timestamps
#     end
#   end
# end



