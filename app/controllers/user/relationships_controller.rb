class User::RelationshipsController < ApplicationController
	def follows
    user = User.find(params[:id])
    @users = user.followings
  end

  def followers
    user = User.find(params[:id])
    @users = user.followers
  end
  
  def create
    user = User.find(params[:follow_id])
    following = current_user.follow(user)
    if following.save
      flash[:success] = 'ユーザーをフォローしました'
      redirect_to user_users_path
    else
      flash.now[:alert] = 'ユーザーのフォローに失敗しました'
      redirect_to user_users_path
    end
  end

  def destroy
    user = User.find(params[:follow_id])
    following = current_user.unfollow(user)
    if following.destroy
      flash[:success] = 'ユーザーのフォローを解除しました'
      redirect_to user_users_path
    else
      flash.now[:alert] = 'ユーザーのフォロー解除に失敗しました'
      redirect_to user_users_path
    end
  end
end
