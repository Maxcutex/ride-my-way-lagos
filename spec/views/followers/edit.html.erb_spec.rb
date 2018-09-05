require 'rails_helper'

RSpec.describe "followers/edit", type: :view do
  let(:user) { create(:user) }

  before(:each) do
    @ride = create(:ride, user_id: user.id)
    @follower = assign(:follower, Follower.create!(:ride_id => @ride.id,:user_id => user.id))
  end

  it "renders the edit follower form" do
    render

    assert_select "form[action=?][method=?]", edit_ride_follower_path(id: @follower.id, ride_id: @ride.id), "post" do
    end
  end
end
