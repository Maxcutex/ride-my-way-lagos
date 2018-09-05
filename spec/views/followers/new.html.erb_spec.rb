require 'rails_helper'

RSpec.describe "followers/new", type: :view do
  let (:user) { create(:user)}
  
  before(:each) do
    @ride =  create(:ride, user: user)
    assign(:follower, Follower.new())
  end

  it "renders new follower form" do
    render

    assert_select "form[action=?][method=?]", ride_followers_path(ride_id: @ride.id), "post" do
    end
  end
end
