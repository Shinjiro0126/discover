class Hashtag < ApplicationRecord
  validates :hashname, presence: true, length: { maximum: 50 }
  has_many :tweet_hashtags, dependent: :destroy
  has_many :tweets, through: :tweet_hashtags
end
