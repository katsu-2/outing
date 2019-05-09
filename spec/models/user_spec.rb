require 'rails_helper'

RSpec.describe User, type: :model do
  it "名前、メールアドレス、パスワードがあれば有効" do
    expect(build(:user)).to be_valid
  end

  it "名前が無ければ無効" do
    user = build(:user, name: nil)
    user.valid?
    expect(user.errors[:name]).to include("が入力されていません。")
  end

  it "名前が16字以上は無効" do
    user = build(:user, name: "a" * 16)
    user.valid?
    expect(user.errors[:name]).to include("は15文字以下に設定して下さい。")
  end

  it "重複するメールアドレスは無効" do
    create(:user, email: "tester@example.com")
    user = build(:user, email: "tester@example.com")
    user.valid?
    expect(user.errors[:email]).to include("は既に使用されています。")
  end

  it "メールアドレスが無ければ無効" do
    user = build(:user, email: nil)
    user.valid?
    expect(user.errors[:email]).to include("が入力されていません。")
  end

  it "パスワードが無いと無効" do
    user = build(:user, password: nil)
    user.valid?
    expect(user.errors[:password]).to include("が入力されていません。")
  end
end
