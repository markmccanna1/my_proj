class TweetWorker
  include Sidekiq::Worker


  def perform(tweet_id)
    tweet = Tweet.find(tweet_id)
    user = tweet.user
    user.twitter_client.update(tweet.status)
  end

  def self.job_is_complete(jid)
    waiting = Sidekiq::Queue.new
    working = Sidekiq::Workers.new
    pending = Sidekiq::ScheduleSet.new
    return false if pending.find {|job| job.jid == jid}
    return false if waiting.find {|job| job.jid == jid}
    return false if pending.find {|worker, info| info["payload"]["jid"] == jid}
    true
  end
end
