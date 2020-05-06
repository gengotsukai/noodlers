class User::ShopLikesController < ApplicationController
	def create
            shop = Shop.find(params[:shop_id])
            like = current_user.shop_likes.new(shop_id: shop.id)
            like.save
            redirect_back(fallback_location: root_url)
        end
        def destroy
            shop = Shop.find(params[:shop_id])
            like = current_user.shop_likes.find_by(shop_id: shop.id)
            like.destroy
            redirect_back(fallback_location: root_url)
        end
end
