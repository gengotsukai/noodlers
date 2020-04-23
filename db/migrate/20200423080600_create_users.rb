class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :nickname
      t.string :introduction
      t.string :email, null: false, default: ""
      t.string :encrypted_password, null: false, default: ""
      t.timestamps
    end
    create_table :relationships do |t|
      t.integer :user_id
      t.integer :follow_id
      t.timestamps
    end
    create_table :genres do |t|
      t.integer :user_id
      t.string :genre_name
      t.timestamps
    end
    create_table :user_genres do |t|
      t.integer :user_id
      t.integer :genre_id
      t.timestamps
    end
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
    create_table :shop_likes do |t|
      t.integer :user_id
      t.integer :shop_id
      t.timestamps
    end
    create_table :shop_comments do |t|
      t.integer :user_id
      t.integer :shop_id
      t.text :opinion
      t.timestamps
    end
  end
end
