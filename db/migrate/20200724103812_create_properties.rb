class CreateProperties < ActiveRecord::Migration[5.2]
  def change
    create_table :properties do |t|
      t.string :type, null: false
      t.string :photos, null: false
      t.integer :price, null: false
      t.integer :agent_id, foreign_key: true, null: false
      t.timestamps
    end
  end
end
