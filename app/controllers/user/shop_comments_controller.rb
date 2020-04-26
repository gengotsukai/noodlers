class User::ShopCommentsController < ApplicationController
	def create
		shop = Shop.find(params[:shop_id])
		comment = current_user.shop_comments.new(shop_comment_params)
		comment.shop_id = shop.id
		comment.save
		redirect_to user_shop_path(shop)
	end
	def destroy
		@shopcomment = ShopComment.find(params[:shop_id])
		shop = @shopcomment.shop
  		@shopcomment.destroy
  		redirect_to user_shop_path(user.id)
	end
	private
	def shop_comment_params
		params.require(:shop_comment).permit(:opinion)
	end
end
