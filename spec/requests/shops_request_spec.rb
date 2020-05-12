require 'rails_helper'

RSpec.describe "Shops", type: :request do
	describe '店の投稿一覧ページ' do
        context "店の投稿一覧ページが正しく表示される" do
            before do
                get user_shops_path
            end
            it 'リクエストは200 OKとなること' do
                expect(response.status).to eq 200
            end
            it '[店の投稿一覧]が正しく表示されていること' do
                expect(response.body).to include("店の投稿一覧")
            end
        end
    end

end
