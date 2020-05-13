require 'rails_helper'

RSpec.describe User, type: :model do
  before do
        #Factory Botというgemを使い、テスト用に必要な外部の情報(例:userやshopのidなど)を生成するための記述
		@user = create(:user)
	end

  	context "データが正しく保存される" do
        before do
            user = @user
            user.nickname = "たろう"
            user.email = "a1@a1"
            #@user = User.new(genre_name:"つけ麺",user_id:@user.id)
            user.save
        end
        it "全て入力してあるので保存される" do
            expect(@user).to be_valid
        end
    end

    context "データが正しく保存されない" do
        before do
            user = @user
            user.nickname = ""
            user.email = ""
            #@user = User.new(genre_name:"つけ麺",user_id:@user.id)
            user.save
        end
        it "nicknameとemailが入力されていないので保存されない" do
            expect(@user).to be_invalid
            expect(@user.errors[:nickname]).to include("can't be blank")
            expect(@user.errors[:email]).to include("can't be blank")
        end
    end
end
