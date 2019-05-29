require 'rails_helper'

RSpec.describe Api::V1::ShowsController, type: :controller do

  describe "GET #index" do

    before(:each) {
      Show.create!(title: "Joe Rogan Podcast")
    }

    it "returns success" do
      get "index"
      expect(response).to have_http_status(:success)
    end

    it "returns the corrrect amount of shows" do
      get "index"
      expect(JSON.parse(response.body).count).to eq(1)
    end
  end

  describe "GET #show" do

    before(:each) {
      Show.create!(title: "Joe Rogan Podcast")
    }

    it "returns success" do
      get "show", params: { id: Show.last.id }
      expect(response).to have_http_status(:success)
    end

    it "returns the correct show details" do
      get "show", params: { id: Show.last.id }
      expect(JSON.parse(response.body).fetch('title')).to eq("Joe Rogan Podcast")
    end
  end

end
