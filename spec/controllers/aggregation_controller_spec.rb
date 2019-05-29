require 'rails_helper'

RSpec.describe AggregatorsController, type: :controller do

  describe "GET #engress" do
    it "returns unsupported media type error if param isn't a feed" do
      get 'engress', params: { feed: '' }
      expect(response).to have_http_status(:unsupported_media_type)
    end

    it "returns success if param is a feed" do
      get 'engress', params: { feed: 'http://atp.fm/episodes?feed=true  '}
      expect(response).to have_http_status(:success)
    end
  end

end
