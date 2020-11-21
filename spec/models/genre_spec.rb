require 'rails_helper'

RSpec.describe Genre, type: :model do
  describe "アソシエーションのテスト" do
    context "Eventモデルとの関係" do
        it "1:Nとなっている" do
          expect(Genre.reflect_on_association(:events).macro).to eq :has_many
        end
    end
  end
end
