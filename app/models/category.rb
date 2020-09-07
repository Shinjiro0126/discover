class Category < ActiveHash::Base
  self.data = [
    {id: 0, name: 'カテゴリーを選択してください'},{id: 1, name: 'gourmet'},{id: 2, name: 'spot'}
  ]
  include ActiveHash::Associations
  has_many :tweets
end
