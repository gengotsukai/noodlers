class CreateShops < ActiveRecord::Migration[5.2]
  def change
    create_table :shops do |t|
      t.integer :user_id
      t.integer :genre_id
      t.string :shop_name
      t.string :inquiry
      t.string :address
      t.string :price_range
      t.string :transport
      t.string :payment_method
      t.string :seats_number
      t.string :cigarette
      t.timestamps
    end
  end
end
