require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  describe "GET #index" do
    before do
      @user = create(:user)
      @category = create(:category)
    end

    context "登録済みユーザー" do
      before do
        sign_in @user
        get :index
      end

      it "正常にレスポンス返す" do
        expect(response).to be_successful
      end

      it "200レスポンス返す" do
        expect(response).to have_http_status 200
      end

      it "indexテンプレの表示" do
        expect(response).to render_template :index
      end

    end

    context "未登録ユーザー" do
      before do
        get :index
      end

      it "正常にレスポンス返す" do
        expect(response).to be_successful
      end

      it "200レスポンス返す" do
        expect(response).to have_http_status 200
      end

      it "indexテンプレの表示" do
        expect(response).to render_template :index
      end
    end
  end

  describe "GET #show" do
    before do
      @user = create(:user)
      # @category = create(:category)
      @post = create(:post, user: @user)
    end

    context "登録済みユーザー" do
      before do
        sign_in @user
        get :show, params: {id: @post.id}
      end

      it "200レスポンス返す" do
        expect(response).to have_http_status 200
      end
      it "showテンプレの表示"
    end

    context "未登録ユーザー" do
    end
  end
end
