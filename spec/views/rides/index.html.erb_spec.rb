require 'rails_helper'

RSpec.describe "rides/index", type: :view do
  let(:user) { create(:user)}
  let(:user1) { create(:user, email: "mymail@ee.com")}
  before(:each) do
    assign(:rides, [
      create(:ride, user_id: user.id),
      create(:ride, user_id: user1.id)
    ])
  end

  it "renders a list of rides" do
    render
  end
end
