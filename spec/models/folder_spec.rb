require 'rails_helper'

RSpec.describe Folder, type: :model do
  before do
    @user = build(:user)
  end

  describe "バリデーションテスト" do
    it "タイトルがあれば有効" do
      folder = build(:folder, user: @user)
      expect(folder).to be_valid
    end

    it "タイトルが無ければ無効" do
      folder = build(:folder, name: nil, user: @user)
      folder.valid?
      expect(folder.errors[:name]).to include("が入力されていません。")
    end

    it "タイトルが20字以上で無効" do
      folder = build(:folder, name: "a" * 21, user: @user)
      folder.valid?
      expect(folder.errors[:name]).to include("は20文字以下に設定して下さい。")
    end
  end
end
