require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "#show" do
    before do
      @user = create(:user)
    end

    context "ログイン済みユーザー" do
      before do
        sign_in @user
        get :show, params: { id: @user.id }
      end

      it "正常にレスポンスを返すこと" do
        expect(response).to be_success
      end

      it "200レスポンスを返すこと" do
        expect(response).to have_http_status 200
      end

      it "ユーザー詳細ページが表示される" do
        expect(@user).to eq(controller.current_user)
      end
    end

    context "未ログインユーザー" do
      before do
        get :show, params: { id: @user.id }
      end

      it "302レスポンスを返すこと" do
        expect(response).to have_http_status 302
      end

      it "ログインページにリダイレクトする" do
        expect(response).to redirect_to new_user_session_path
      end
    end
  end
end
