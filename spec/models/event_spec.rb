require 'rails_helper'

RSpec.describe Event, type: :model do
  describe "バリデーションのテスト" do
    before do
      @event = build(:event)
    end

    it "titleが入力されていない" do
      @event.title = ""
      expect(@event).to be_invalid
    end
    it "titleが2文字以上かつ30文字以下であること" do
      @event.title = "a" * 1 && "a" * 31
      expect(@event).to be_invalid
    end
    it "bodyが入力されていない" do
      @event.body = ""
      expect(@event).to be_invalid
    end
    it "bodyが500文字以下であること" do
      @event.body = "a" * 501
      expect(@event).to be_invalid
    end
    it "recruitmentが入力されていない" do
      @event.recruitment = ""
      expect(@event).to be_invalid
    end
    it "recruitmentが500文字以下であること" do
      @event.recruitment = "a" * 501
      expect(@event).to be_invalid
    end
    it "event_dateが入力されていない" do
      @event.event_date = ""
      expect(@event).to be_invalid
    end
    it "open_hourが入力されていない" do
      @event.open_hour = ""
      expect(@event).to be_invalid
    end
    it "open_minuteが入力されていない" do
      @event.open_minute = ""
      expect(@event).to be_invalid
    end
    it "end_hourが入力されていない" do
      @event.end_hour = ""
      expect(@event).to be_invalid
    end
    it "bodyが入力されていない" do
      @event.body = ""
      expect(@event).to be_invalid
    end
    it "end_minuteが入力されていない" do
      @event.end_minute = ""
      expect(@event).to be_invalid
    end
end

  describe "アソシエーションのテスト" do
      context "Commentモデルとの関係" do
          it "1:Nとなっている" do
            expect(Event.reflect_on_association(:comments).macro).to eq :has_many
          end
      end
      context "Favoriteモデルとの関係" do
          it "1:Nとなっている" do
            expect(Event.reflect_on_association(:favorites).macro).to eq :has_many
          end
      end
      context "Userモデルとの関係" do
        it "N:1となっている" do
          expect(Event.reflect_on_association(:user).macro).to eq :belongs_to
        end
      end
      context "Genreモデルとの関係" do
        it "N:1となっている" do
          expect(Event.reflect_on_association(:genre).macro).to eq :belongs_to
        end
      end
  end
end
