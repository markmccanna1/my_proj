class Fear < ActiveRecord::Base
  has_many :user_fears

end



# class CreateFears < ActiveRecord::Migration
#   def change
#     create_table :fears do |t|
#       t.string :description
#       t.timestamps
#     end
#   end
# end
