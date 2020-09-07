class AddCategoryIdToTweets < ActiveRecord::Migration[6.0]
  def change
    add_column :tweets, :category_id, :integer
  end
end
