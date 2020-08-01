class CreateApartmentAttachments < ActiveRecord::Migration[5.2]
  def change
    create_table :apartment_attachments do |t|
      t.string :apartmentphoto
      t.references :apartment, foreign_key: true

      t.timestamps
    end
  end
end
