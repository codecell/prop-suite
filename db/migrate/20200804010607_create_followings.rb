class CreateFollowings < ActiveRecord::Migration[5.2]
  def change
    create_table :followings do |t|
      t.integer :follower_id, foreign_key: true, null: false, index: true
      t.integer :followed_id, foreign_key: true, null: false, index: true

      t.timestamps
    end
  end
end
