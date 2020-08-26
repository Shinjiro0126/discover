class Tweet < ApplicationRecord
  validates :text, presence: true
  validates :image, presence: true
  
  belongs_to :user

  mount_uploader :image, ImageUploader

  def self.search(search)
    if search 
      Tweet.where('text LIKE(?)', "%#{search}%")
    else  
      Tweet.all 
    end  
  end
end
