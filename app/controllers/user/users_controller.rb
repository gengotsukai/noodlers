class User::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :baria_user, only: [:update]

  def index
  	@users = User.all #一覧表示するためにUserモデルのデータを全て変数に入れて取り出す。
  	@shop = Shop.new #new shopの新規投稿で必要（保存処理はshopsコントローラー側で実施）
  end

  def show
  	@user = User.find(params[:id])
  	@shops = @user.shops
  	@shop = Shop.new #new shopの新規投稿で必要（保存処理はshopsコントローラー側で実施）
  end

  def edit
  	@user = User.find(params[:id])
    if current_user.id != @user.id
      redirect_to user_user_path(current_user.id)
    end
  end

  def confirm
    @user = User.find(current_user.id)
  end

  def update
  	@user = User.find(params[:id])
  	if @user.update(user_params)
  		redirect_to user_user_path(@user.id), notice: "successfully updated user!"
  	else
  		render :edit
  	end
  end

  private
  def user_params
  	params.require(:user).permit(:nickname, :introduction, :profile_image_id)
  end

  #url直接防止　メソッドを自己定義してbefore_actionで発動。
   def baria_user
  	unless params[:id].to_i == current_user.id
  		redirect_to user_user_path(current_user)
  	end
   end
end
