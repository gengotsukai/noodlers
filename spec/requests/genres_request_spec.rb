require 'rails_helper'

RSpec.describe "Genres", type: :request do
	describe 'ジャンル一覧ページ' do
        context "ジャンル一覧ページが正しく表示される" do
            before do
                get user_genres_path
            end
            it 'リクエストは200 OKとなること' do
                expect(response.status).to eq 200
            end
            it '[ジャンル追加・一覧画面]が正しく表示されていること' do
                expect(response.body).to include("ジャンル追加・一覧画面")
            end
        end
    end

end