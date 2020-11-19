require 'rails_helper'

RSpec.describe User, type: :model do
    describe "バリデーションのテスト" do
        before do
            @user = build(:user)
        end
        context "ユーザー情報が有効である場合" do
            it "すべて正しく入力されている" do
                expect(@user).to be_valid
            end  
        end

        context "ユーザー情報が無効である場合" do
            it "nameが入力されていない" do
                @user.name = ""
                expect(@user).to be_invalid
            end
            it "nameが2文字以上かつ30文字以下であること" do
                @user.name = "a" * 1 && "a" * 31
                expect(@user).to be_invalid
            end
            it "emailが入力されていない" do
                @user.email = ""
                expect(@user).to be_invalid
            end
            it "introductionが入力されていない" do
                @user.introduction = ""
                expect(@user).to be_invalid
            end
            it "introductionが200文字以下であること" do
                @user.introduction = "a" * 201
                expect(@user).to be_invalid
            end
        end
    end

    describe "アソシエーションのテスト" do
        context "Eventモデルとの関係" do
            it "1:Nとなっている" do
            expect(User.reflect_on_association(:events).macro).to eq :has_many
            end
        end
        context "Commentモデルとの関係" do
            it "1:Nとなっている" do
            expect(User.reflect_on_association(:comments).macro).to eq :has_many
            end
        end
        context "Favoriteモデルとの関係" do
            it "1:Nとなっている" do
            expect(User.reflect_on_association(:favorites).macro).to eq :has_many
            end
        end
        context "Messageモデルとの関係" do
            it "1:Nとなっている" do
            expect(User.reflect_on_association(:messages).macro).to eq :has_many
            end
        end
        context "Entryモデルとの関係" do
            it "1:Nとなっている" do
            expect(User.reflect_on_association(:entries).macro).to eq :has_many
            end
        end
    end
end