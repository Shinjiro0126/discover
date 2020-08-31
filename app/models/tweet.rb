class Tweet < ApplicationRecord
  validates :text, presence: true
  validates :image, presence: true
  
  belongs_to :user
  has_many :comments
  has_many :likes

  mount_uploader :image, ImageUploader

  def self.search(search)
    if search 
      Tweet.where('text LIKE(?)', "%#{search}%")
    else  
      Tweet.all 
    end  
  end
end
