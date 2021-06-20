class TweetComment < ApplicationRecord
  # 指定したカラムに何も値が入っていなかったときには保存されない
  validates :rate, presence: true

  belongs_to :user
  belongs_to :tweet

end
