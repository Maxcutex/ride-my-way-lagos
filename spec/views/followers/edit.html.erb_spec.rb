require 'rails_helper'

RSpec.describe "followers/edit", type: :view do
  let(:user) { FactoryBot.create(:user) }

  before(:each) do
    @ride = FactoryBot.create(:ride, user_id: user.id)
    @follower = assign(:follower, Follower.create!(:ride_id => @ride.id,:user_id => user.id))
  end

  it "renders the edit follower form" do
    render

    assert_select "form[action=?][method=?]", follower_path(@follower), "post" do
    end
  end
end
