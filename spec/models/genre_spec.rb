require 'rails_helper'

RSpec.describe Genre, type: :model do
	before do
		@user = create(:user)
	end

  	context "データが正しく保存される" do
        before do
            @genre = Genre.new(genre_name:"つけ麺",user_id:@user.id)
            @genre.save
        end
        it "全て入力してあるので保存される" do
            expect(@genre).to be_valid
        end
    end

    context "データが正しく保存されない" do
        before do
            @genre = Genre.new(genre_name:"",user_id:@user.id)
            @genre.save
        end
        it "genre_nameが入力されていないので保存されない" do
            expect(@genre).to be_invalid
            expect(@genre.errors[:genre_name]).to include("can't be blank")
        end
    end
end
