require 'rails_helper'

RSpec.describe Relationship, type: :model do
  	before do
        #Factory Botというgemを使い、テスト用に必要な外部の情報(例:userやshopのidなど)を生成するための記述
		@user = create(:user)
		@another_user = create(:another_user)
	end

  	context "データが正しく保存される" do
        it "全て入力してあるので保存される" do
        	@relationship = Relationship.new(user_id:@user.id, follow_id: @another_user.id)
        	@relationship.save
            expect(@relationship).to be_valid
        end
    end

    context "データが正しく保存されない" do
         it "user_idはあるが、follow_idがないため、保存されない" do
         	@relationship = Relationship.new(user_id:@user.id)
        	@relationship.save
            expect(@relationship).to be_invalid
            expect(@relationship.errors[:follow_id]).to include("can't be blank")
         end
         it "follow_idはあるが、user_idがないため、保存されない" do
         	@relationship = Relationship.new(follow_id:@another_user.id)
        	@relationship.save
            expect(@relationship).to be_invalid
            expect(@relationship.errors[:user_id]).to include("can't be blank")
         end
         it "user_idとfollow_idがないため、保存されない" do
         	@relationship = Relationship.new
        	@relationship.save
            expect(@relationship).to be_invalid
            expect(@relationship.errors[:user_id]).to include("can't be blank")
            expect(@relationship.errors[:follow_id]).to include("can't be blank")
         end
    end
 end
