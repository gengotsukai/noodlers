require 'rails_helper'

RSpec.describe ShopComment, type: :model do
  before do
		#Factory Botというgemを使い、テスト用に必要な外部の情報(例:userやshopのidなど)を生成するための記述
		@user = create(:user)
		@genre = create(:genre)
		@shop = create(:shop)
	end

  	context "データが正しく保存される" do
        before do
            @shop_comment = ShopComment.new(opinion:"おいしい", user_id:@user.id, shop_id:@shop.id)
            @shop_comment.save
        end
        it "全て入力してあるので保存される" do
            expect(@shop_comment).to be_valid
        end
    end

    context "データが正しく保存されない" do
        before do
            @shop_comment = ShopComment.new(opinion:"", user_id:@user.id, shop_id:@shop.id)
            @shop_comment.save
        end
        it "opinionが入力されていないので保存されない" do
            expect(@shop_comment).to be_invalid
            expect(@shop_comment.errors[:opinion]).to include("can't be blank")
        end
    end
end
