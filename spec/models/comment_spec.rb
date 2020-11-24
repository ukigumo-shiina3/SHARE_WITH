require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe "バリデーションのテスト" do
    before do
      @comment = build(:comment)
    end

    it "commentが入力されていない" do
      @comment.comment = ""
      expect(@comment).to be_invalid
    end
    it "commentが500文字以下であること" do
      @comment.comment = "a" * 501
      expect(@comment).to be_invalid
    end
  end

  describe "アソシエーションのテスト" do
    context "Userモデルとの関係" do
      it "N:1となっている" do
        expect(Comment.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end
    context "Eventモデルとの関係" do
      it "N:1となっている" do
        expect(Comment.reflect_on_association(:event).macro).to eq :belongs_to
      end
    end
  end
end
