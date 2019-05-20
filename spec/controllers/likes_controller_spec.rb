require 'rails_helper'

RSpec.describe LikesController, type: :controller do
  before do
    @user = create(:user)
    @post = create(:post, user: @user)
    @like = create(:like, user_id: @user.id, post_id: @post.id)
  end

  describe "#create" do
    context "登録済みユーザー" do
      before do
        sign_in @user
      end

      it "JSONを使って正常なレスポンスを返す" do
        post :create, format: :json, params: { post_id: @post.id, id: @like.id }
        expect(response.content_type).to eq "text/html"
      end

      it "いいねをする" do
        expect{
          post :create, format: :json, params: {
            post_id: @post.id, id: @like.id
          }
        }.to change{Like.count}.by(1)
      end
    end

    context "未登録ユーザー" do
      before do
        post :create, format: :json, params: { post_id: @post.id, id: @like.id }
      end

      it "レスポンスの失敗" do
        expect(response).to_not be_success
      end

      it "いいねできない" do
        expect{
          post :create, format: :json, params: {
            post_id: @post.id, id: @like.id
          }
        }.to change{Like.count}.by(0)
      end
    end
  end

  describe "#destroy" do
    context "登録済みユーザー" do
      before do
        sign_in @user
      end

      it "JSONを使って正常なレスポンスを返す" do
        delete :destroy, format: :json, params: { post_id: @post.id, id: @like.id }
        expect(response.content_type).to eq "text/html"
      end

      it "いいねを削除する" do
        expect {
          delete :destroy, format: :json, params: {
            post_id: @post.id, id: @like.id
          }
        }.to change{Like.count}.by(-1)
      end
    end
  end
end
