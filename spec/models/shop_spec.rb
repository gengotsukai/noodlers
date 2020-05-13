require 'rails_helper'

RSpec.describe Shop, type: :model do
	before do
        #Factory Botというgemを使い、テスト用に必要な外部の情報(例:userやshopのidなど)を生成するための記述
		@user = create(:user)
		@genre = create(:genre)
	end

  	context "データが正しく保存される" do
        before do
            @shop = Shop.new(shop_name:"さとう", inquiry:"000", address:"tokyo", user_id:@user.id, genre_id:@genre.id)
            @shop.save
        end
        it "全て入力してあるので保存される" do
            expect(@shop).to be_valid
        end
    end

    context "データが正しく保存されない" do
        before do
            @shop = Shop.new(shop_name:"", inquiry:"", address:"", user_id:@user.id, genre_id:@genre.id)
            @shop.save
        end
        it "shop_name, inquiry, addressが入力されていないので保存されない" do
            expect(@shop).to be_invalid
            expect(@shop.errors[:shop_name]).to include("can't be blank")
            expect(@shop.errors[:inquiry]).to include("can't be blank")
            expect(@shop.errors[:address]).to include("can't be blank")
        end
    end
end
