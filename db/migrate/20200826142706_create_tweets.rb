class CreateTweets < ActiveRecord::Migration[6.0]
  def change
    create_table :tweets do |t|
      t.string :name
      t.text :text
      t.string :image
      t.integer :user_id
      t.timestamps
    end
  end
end
