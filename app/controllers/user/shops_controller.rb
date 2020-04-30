class User::ShopsController < ApplicationController
	 def index
    	@shops = Shop.all
    	@shop = Shop.new
	 end

   def show
  		@myshop = Shop.find(params[:id])
      @shop = Shop.new
      @user = @myshop.user
      @shop_comment = ShopComment.new
	 end

   def edit
    @shop = Shop.find(params[:id])
    if current_user.id != @shop.user.id
      redirect_to user_shops_path
    end
   end

   def new
		  @shop = Shop.new
	 end

   def create
		  @shop = Shop.new(shop_params) #Shopモデルのテーブルを使用しているのでShopコントローラで保存する。
    	@shop.user_id = current_user.id
  		if @shop.save! #入力されたデータをdbに保存する。
  			 redirect_to user_shop_path(@shop.id), flash: { notice: 'You have created shop successfully.' }
  		else
  			 @shops = Shop.all
      	 @user = current_user
  			 render :index
  		end
  	end

    def shop_params
  		params.require(:shop).permit(:shop_name, :genre_id, :inquiry, :address, :price_range, :transport, :payment_method, :seats_number, :cigarette)
  	end
end
