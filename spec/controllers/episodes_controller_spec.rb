require 'rails_helper'

RSpec.describe Api::V1::EpisodesController, type: :controller do

  describe "GET #index" do

    before(:each) {
      s = Show.create!(title: "Joe Rogan Podcast")
      s.episodes.create!(title: "Joe Episode")
    }

    it "returns success" do
      get "index", params: { show_id: Show.last.id}
      expect(response).to have_http_status(:success)
    end

    it "returns the corrrect amount of episodes" do
      get "index", params: { show_id: Show.last.id}
      expect(JSON.parse(response.body).count).to eq(1)
    end
  end

  describe "GET #show" do

    before(:each) {
      s = Show.create!(title: "Joe Rogan Podcast")
      s.episodes.create!(title: "Joe Episode")
    }

    it "returns success" do
      get "show", params: { id: Episode.last.id }
      expect(response).to have_http_status(:success)
    end

    it "returns the correct episode details" do
      get "show", params: { id: Episode.last.id }
      expect(JSON.parse(response.body).fetch('title')).to eq("Joe Episode")
    end
  end

end
