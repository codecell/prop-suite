class AddCoverphotoToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :coverphoto, :string
  end
end
