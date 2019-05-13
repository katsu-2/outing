require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @user = build(:user)
    @post = build(:post)
  end

  describe "バリデーションテスト" do
    it "ユーザー、問題、コメントがあれば有効" do
      comment = build(:comment, user: @user, post: @post)
      expect(comment).to be_valid
    end

    it "コメントがないと無効" do
      comment = build(:comment, comment: nil, user: @user, post: @post)
      comment.valid?
      expect(comment.errors[:comment]).to include("が入力されていません。")
    end

    it "コメントが1000字以上は無効" do
      comment = build(:comment, comment: "a" * 1001, user: @user, post: @post)
      comment.valid?
      expect(comment.errors[:comment]).to include("は1000文字以下に設定して下さい。")
    end
  end
end
