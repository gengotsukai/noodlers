class AddShopStatusToShops < ActiveRecord::Migration[5.2]
  def change
    add_column :shops, :shop_status, :string
  end
end
