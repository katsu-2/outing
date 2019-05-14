require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  before do
    @user = create(:user)
    @post = create(:post, user: @user)
    @other_user = create(:user, email: "other@example.com")
    @other_post = create(:post, user: @other_user)
  end

  describe "#create" do
    context "登録済みユーザー" do
      it "投稿に対してコメントする" do
        comment_params = attributes_for(:comment, comment: "aaaaa")
        sign_in @user
        expect {
          post :create, params: { post_id: @post.id, comment:comment_params }
        }.to change(Comment, :count).by(1)
      end

      it "コメントに成功したら問題詳細にリダイレクト" do

      end
    end

    context "未登録ユーザー" do

    end
  end

  describe "#destroy" do
    context "登録済みユーザー" do

    end

    context "未登録ユーザー" do

    end
  end
end
