class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :reviewer_id, foreign_key: true, null: false, index: true
      t.integer :reviewed_id, foreign_key: true, null: false, index: true
      t.column :rating, :integer, default: 0
      t.text :content

      t.timestamps
    end
  end
end
