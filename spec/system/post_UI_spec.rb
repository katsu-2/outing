require 'rails_helper'

RSpec.describe "問題一覧、詳細ページのUI", type: :system do

  before do
    @user = create(:user)
    @other_user = create(:user, email: "b@example.com")
    @post = create(:post, user: @user)
    @other_post = create(:post, user: @user, title: "other title")
  end

  describe "問題詳細表示機能" do
    context "カレントユーザー" do
      it "編集と削除ボタンが表示" do
        visit new_user_session_path

        fill_in "メールアドレス", with: @user.email
        fill_in "パスワード", with: @user.password
        click_button "ログイン"

        visit post_path(id: @post.id)
        expect(page).to have_link(nil, href: edit_post_path(id: @post.id))
        expect(page).to have_selector 'a[data-method=delete]'
      end
    end

    context "他のユーザー" do
      it "編集と削除ボタンが表示されない" do
        visit new_user_session_path

        fill_in "メールアドレス", with: @other_user.email
        fill_in "パスワード", with: @other_user.password
        click_button "ログイン"

        visit post_path(id: @post.id)
        expect(page).to_not have_link(nil, href: edit_post_path(id: @post.id))
        expect(page).to_not have_selector 'a[data-method=delete]'
      end
    end
  end

  describe "問題一覧表示機能" do
    it "記事詳細ページに遷移できる" do
      visit new_user_session_path

      fill_in "メールアドレス", with: @other_user.email
      fill_in "パスワード", with: @other_user.password
      click_button "ログイン"

      visit root_path
      expect(page).to have_link(@post.title, href: post_path(id: @post.id))
    end
  end
end
