require 'rails_helper'

RSpec.describe Api::V1::PeopleController, type: :controller do

  describe "GET #hosts" do

    before(:each) {
      s = Show.create!(title: "Joe Rogan Podcast")
      s.hosts.create!(name: "Joe Rogan")
    }

    it "returns success" do
      get "hosts", params: { show_id: Show.last.id}
      expect(response).to have_http_status(:success)
    end

    it "returns the corrrect amount of hosts" do
      get "hosts", params: { show_id: Show.last.id}
      expect(JSON.parse(response.body).count).to eq(1)
    end

    it "returns the correct host details" do
      get "hosts", params: { show_id: Show.last.id}
      expect(JSON.parse(response.body).first.fetch('name')).to eq("Joe Rogan")
    end
  end

  describe "GET #guests" do

    before(:each) {
      s = Show.create!(title: "Joe Rogan Podcast")
      e = s.episodes.create!(title: "Joe Episode")
      e.guests.create!(name: "Kevin Rose")
    }

    it "returns success" do
      get "guests", params: { episode_id: Episode.last.id }
      expect(response).to have_http_status(:success)
    end

    it "returns the corrrect amount of hosts" do
      get "guests", params: { episode_id: Episode.last.id}
      expect(JSON.parse(response.body).count).to eq(1)
    end

    it "returns the correct guest details" do
      get "guests", params: { episode_id: Episode.last.id }
      expect(JSON.parse(response.body).first.fetch('name')).to eq("Kevin Rose")
    end
  end

  describe "GET #guest" do

    before(:each) {
      s = Show.create!(title: "Joe Rogan Podcast")
      e = s.episodes.create!(title: "Joe Episode")
      e.guests.create!(name: "Kevin Rose")
    }

    it "returns success" do
      get "guest", params: { guest_id: Guest.last.id }
      expect(response).to have_http_status(:success)
    end

    it "returns the correct guest details" do
      get "guest", params: { guest_id: Guest.last.id }
      expect(JSON.parse(response.body).fetch('name')).to eq("Kevin Rose")
    end
  end

  describe "GET #host" do

    before(:each) {
      s = Show.create!(title: "Joe Rogan Podcast")
      s.hosts.create!(name: "Joe Rogan")
    }

    it "returns success" do
      get "host", params: { host_id: Host.last.id }
      expect(response).to have_http_status(:success)
    end

    it "returns the correct host details" do
      get "host", params: { host_id: Host.last.id }
      expect(JSON.parse(response.body).fetch('name')).to eq("Joe Rogan")
    end
  end
end
