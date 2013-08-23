class Tweet < ActiveRecord::Base
  belongs_to :user
  belongs_to :friend
end



# class CreateTweets < ActiveRecord::Migration
#   def change
#     create_table :tweets do |t|
#       t.string :message
#       t.belongs_to :friend
#       t.belongs_to :user
#       t.timestamps
#     end
#   end
# end

