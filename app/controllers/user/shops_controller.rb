class User::ShopsController < ApplicationController
	 def search
    @shops = Shop.search(params[:search])
   end

   def index
    	@shops = Shop.all
    	@shop = Shop.new
	 end

   def show
  		@myshop = Shop.find(params[:id])
      @shop = Shop.new
      @user = @myshop.user
      #新しいコメント
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

    def update
      @shop = Shop.find(params[:id])
      if @shop.update(shop_params)
        redirect_to user_shop_path(@shop.id), flash: { notice: "店の投稿の更新が無事に出来ました！" }
      else
        render :edit
      end
    end

    def destroy
      @shop = Shop.find(params[:id])
      @shop.destroy
      redirect_to user_shops_path, flash: { notice: "店の投稿を削除しました！" }
    end

    def shop_params
  		params.require(:shop).permit(:shop_name, :genre_id, :inquiry, :address, :price_range, :transport, :payment_method, :seats_number, :cigarette)
  	end
end
