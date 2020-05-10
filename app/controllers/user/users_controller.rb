class User::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :baria_user, only: [:update]
  PER = 4

  def index
    @users = User.page(params[:page]).per(PER)
  	#@users = User.all #一覧表示するためにUserモデルのデータを全て変数に入れて取り出す。
  	@shop = Shop.new #new shopの新規投稿で必要（保存処理はshopsコントローラー側で実施）
  end

  def show
  	@user = User.find(params[:id])
  	@shops = @user.shops
  end

  def edit
  	@user = User.find(params[:id])
    if current_user.id != @user.id
      redirect_to home_about_path
    end
  end

  def confirm
    @user = User.find(current_user.id)
  end

  def update
  	@user = User.find(params[:id])

    #編集しようとしているユーザーが現在ログインしているユーザーと同じかどうかの確認
    if current_user == @user

      if @user.update(user_params)
        flash.now[:success] = 'ユーザー情報の編集に成功しました。'
        render :edit
      else
        flash.now[:danger] = 'ユーザー情報の編集に失敗しました。'
  		  render :edit
      end

    else
      redirect_to home_about_path
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.discard
    redirect_to new_user_session_path, notice: "退会しました。"
  end

  private
  def user_params
  	params.require(:user).permit(:nickname, :introduction, :image)
  end

  #url直接防止　メソッドを自己定義してbefore_actionで発動。
   def baria_user
  	unless params[:id].to_i == current_user.id
  		redirect_to user_user_path(current_user)
  	end
   end
end
