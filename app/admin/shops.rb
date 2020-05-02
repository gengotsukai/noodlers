ActiveAdmin.register Shop do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
   permit_params :user_id, :genre_id, :shop_name, :inquiry, :address, :price_range, :transport, :payment_method, :seats_number, :cigarette, :shop_status
  #
  # or
  #
  # permit_params do
  #   permitted = [:user_id, :genre_id, :shop_name, :inquiry, :address, :price_range, :transport, :payment_method, :seats_number, :cigarette, :shop_status]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
