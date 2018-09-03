require 'rails_helper'

RSpec.describe "rides/index", type: :view do
  let(:user) { FactoryBot.create(:user)}
  let(:user1) { FactoryBot.create(:user, email: "mymail@ee.com")}
  before(:each) do
    assign(:rides, [
      FactoryBot.create(:ride, user_id: user.id),
      FactoryBot.create(:ride, user_id: user1.id)
    ])
  end

  it "renders a list of rides" do
    render
  end
end
