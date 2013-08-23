class User < ActiveRecord::Base
  has_many :tweets
  has_many :user_fears
  has_many :fears, through: :user_fears
  has_many :friends, class_name: "Friend" 
  

  def twitter_client
    @twitter_client ||= Twitter::Client.new(
      oath_token: oath_token,
      oath_token_secret: oath_secret
    )
  end

  def tweet(status)
    tweet = tweets.create!(message: message)
    TweetWorker.perform_async(tweet.id)
  end


end



# class CreateUsers < ActiveRecord::Migration
#   def change
#     create_table :users do |t|
#       t.string :username, null: false
#       t.string :oauth_token
#       t.string :oauth_secret
#       t.timestamps
#     end
#     add_index :users, :username, unique: true
#   end
# end

