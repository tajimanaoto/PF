class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  validates :last_name, presence: true
  validates :first_name, presence: true

  has_many :tweet_comments, dependent: :destroy

  has_many :tweets, dependent: :destroy
  attachment :profile_image

  has_many :favorites, dependent: :destroy
  has_many :favorite_tweets, through: :favorites, source: :tweet

  has_many :reverth_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :followers, through: :reverth_of_relationships, source: :follower
  #フォローされた時の関係を通じて参照→followed_idをフォローしている人

  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :followings, through: :relationships, source: :followed
  #フォローした際の関係を通じて参照→follower_idをフォローしている人

  def follow(user_id)
    relationships.create(followed_id: user_id)
  end

  def unfollow(user_id)
    relationships.find_by(followed_id: user_id).destroy
  end

  def following?(user)
    followings.include?(user)
  end

end
