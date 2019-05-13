# require 'rails_helper'

# RSpec.describe "問題投稿機能", type: :system do
#   before do
#     visit new_user_session_path
#     @user = create(:user)
#     fill_in "メールアドレス", with: @user.email
#     fill_in "パスワード", with: @user.password
#     click_button "ログイン"
#     visit new_post_path

#     @category = create(:category)
#     # @post = create(:post, category: @category)

#   end

#   context "有効な情報を送信" do
#     it "トップページにリダイレクト" do
#       fill_in "例）プログラミングの問題", with: "ruby"
#       fill_in "ここに問題文を書いてください", with: "aaaaaa"
#       fill_in "ここに答えを書いてください", with: "aaaaaa"
#       select '@category', from: 'post[category_id]'
#       click_button "問題の作成"

#       expect(page).to have_content "最新の問題"
#     end
#   end
# end
