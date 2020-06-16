require 'rails_helper'

RSpec.describe "Users", type: :request do
	describe 'ユーザー一覧ページ' do
        context "ユーザー一覧ページが正しく表示される" do
            before do
                get user_users_path
            end
            it 'リクエストは200 OKとなること' do
                expect(response.status).to eq 200
            end
            it '[ユーザー一覧]が正しく表示されていること' do
                expect(response.body).to include("ユーザー一覧")
            end
        end
    end

end