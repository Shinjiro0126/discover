class Tweet < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category

  validates :text, presence: true
  validates :image, presence: true
  validates :category_id, presence: true
  
  belongs_to :user
  has_many :comments
  has_many :likes, dependent: :destroy
  has_many :tweet_hashtags, dependent: :destroy
  has_many :hashtags, through: :tweet_hashtags

  mount_uploader :image, ImageUploader

  def self.search(search)
    if search 
      Tweet.where('text LIKE(?)', "%#{search}%")
    else  
      Tweet.all 
    end  
  end
end
