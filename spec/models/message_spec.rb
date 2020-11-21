require 'rails_helper'

RSpec.describe Message, type: :model do
  describe "バリデーションのテスト" do
    before do
      @user = create(:user)
      @room = create(:room)
      @message = Message.new(
        user_id: @user.id,
        room_id: @room.id,
        content: "内容"
      )
    end
    context "メッセージ情報が有効である場合" do
        it "すべて正しく入力されている" do
        expect(@message).to be_valid
        end  
    end

    context "メッセージ情報が無効である場合" do
      it "contentが入力されていない" do
        @message.content = ""
        expect(@message).to be_invalid
      end
      it "contentが500文字以下であること" do
        @message.content = "a" * 501
        expect(@message).to be_invalid
      end
    end
  end

    describe "アソシエーションのテスト" do
      context "Userモデルとの関係" do
        it "N:1となっている" do
          expect(Message.reflect_on_association(:user).macro).to eq :belongs_to
        end
      end
      context "Roomモデルとの関係" do
        it "N:1となっている" do
          expect(Message.reflect_on_association(:room).macro).to eq :belongs_to
        end
      end
    end
end
