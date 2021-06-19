class AddRateToTweetComment < ActiveRecord::Migration[5.2]
  def change
    add_column :tweet_comments, :rate, :float, null: false, default: 0
  end
end
