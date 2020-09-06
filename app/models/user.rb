class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :email, presence: true 

  has_many :tweets 
  has_many :comments
  has_many :likes, dependent: :destroy
  has_many :like_tweets, through: :likes, source: :tweet

  mount_uploader :user_image, ImageUploader
end
