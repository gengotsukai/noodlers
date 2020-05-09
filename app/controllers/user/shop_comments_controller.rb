class User::ShopCommentsController < ApplicationController
	def create
		@myshop = Shop.find(params[:shop_id])
		comment = current_user.shop_comments.new(shop_comment_params)
		comment.shop_id = @myshop.id
		comment.save
	end
	def destroy
		@shopcomment = ShopComment.find(params[:shop_id])
		@myshop = @shopcomment.shop
  		@shopcomment.destroy
	end
	private
	def shop_comment_params
		params.require(:shop_comment).permit(:opinion)
	end
end
