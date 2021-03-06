class CreateApartments < ActiveRecord::Migration[5.2]
  def change
    create_table :apartments do |t|
      t.string :category, null: false
      t.string :address, null: false
      t.integer :price, null: false
      t.integer :agent_id, foreign_key: true, null: false, index: true
      
      t.timestamps
    end
  end
end
