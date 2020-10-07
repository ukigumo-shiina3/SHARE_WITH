require 'rails_helper'

RSpec.describe "Homes", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/homes/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /about" do
    it "returns http success" do
      get "/homes/about"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /howto" do
    it "returns http success" do
      get "/homes/howto"
      expect(response).to have_http_status(:success)
    end
  end

end
