require 'rails_helper'

RSpec.describe "rides/show", type: :view do
  let(:user) { create(:user)}
  let(:user_o) { create(:user)}

  before(:each) do
    sign_in(user_o)
    @ride = create(:ride, user: user)
    @followers = create(:follower, user: user_o, ride: @ride)
  end

  it "renders attributes in <p>" do
    render
  end

  it "renders current ride" do
  end 

  it "renders current ride with list of followers" do
  end 
end
