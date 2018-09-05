require 'rails_helper'

RSpec.describe "followers/show", type: :view do
  let (:user) { create(:user)}
  let (:ride) { create(:ride, user: user)}
  before(:each) do
    @follower = assign(:follower, create(:follower, will_ride:true, ride: ride, user: user))
  end

  it "renders attributes in <p>" do
    render
  end
end
