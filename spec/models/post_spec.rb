require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "バリデーションのテスト" do
    it "タイトル、問題、答え、カテゴリーがあれば有効" do
      expect(build(:post)).to be_valid
    end

    it "タイトルが無ければ無効" do
      post = build(:post, title: nil)
      post.valid?
      expect(post.errors[:title]).to include("が入力されていません。")
    end

    it "タイトルが31文字以上は無効" do
      post = build(:post, title: "a" * 31)
      post.valid?
      expect(post.errors[:title]).to include("は30文字以下に設定して下さい。")
    end

    it "問題が無ければ無効" do
      post = build(:post, content: nil)
      post.valid?
      expect(post.errors[:content]).to include("が入力されていません。")
    end

    it "答えが無ければ無効" do
      post = build(:post, answer: nil)
      post.valid?
      expect(post.errors[:answer]).to include("が入力されていません。")
    end
  end

  describe "検索結果のテスト" do
    before do
      @post1 = create(:post,
        title: "first title",
        content: "aaa"
      )

      @post2 = create(:post,
        title: "second title",
        content: "aaa"
      )

      @post3 = create(:post,
        title: "third title",
        content: "content first"
      )
    end

    context "一致するデータが見つかるとき" do
      it "タイトル,問題どちらかが一致したデータを返す" do
        expect(Post.search("first")).to include(@post1,@post3)
      end
    end

    context "一致するデータが見つからないとき" do
      it "当てはまる文字列がないと空のコレクションを返す" do
        expect(Post.search("test")).to be_empty
      end

      it "空検索するとpostを全表示する" do
        expect(Post.search(" ")).to include(@post1,@post2,@post3)
      end
    end
  end
end
