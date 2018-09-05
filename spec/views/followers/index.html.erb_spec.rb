require 'rails_helper'

RSpec.describe "followers/index", type: :view do
  let(:user) { FactoryBot.create(:user) }
  let(:user1) { FactoryBot.create(:user, email: "email@mail.com") }
  
   
  before(:each) do
    @ride = FactoryBot.create(:ride, user_id: user.id)
    assign(:followers, [
      Follower.create!(:ride_id => @ride.id,:user_id => user.id),
      Follower.create!(:ride_id => @ride.id,:user_id => user1.id)
    ])
  end

  it "renders a list of followers" do
    render
  end
end
