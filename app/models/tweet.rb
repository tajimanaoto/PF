class Tweet < ApplicationRecord

  validates :title, presence: true
  validates :description, presence: true

  acts_as_taggable

  belongs_to :user
  attachment :image

  has_many :tweet_comments, dependent: :destroy

  has_many :favorites, dependent: :destroy

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end


end
