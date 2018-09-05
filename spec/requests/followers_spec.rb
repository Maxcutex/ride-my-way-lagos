require 'rails_helper'

RSpec.describe "Followers", type: :request do
  describe "GET /rides/1/followers" do
    let(:user) { FactoryBot.create(:user) }
    let(:ride) { FactoryBot.create(:ride, user_id: user.id) }
    
    it "works! (now write some real specs)" do
      get ride_followers_path(ride.id)
      expect(response).to have_http_status(200)
    end
  end
end
