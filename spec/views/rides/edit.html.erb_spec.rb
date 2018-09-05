require 'rails_helper'

RSpec.describe "rides/edit", type: :view do
  let(:user) { FactoryBot.create(:user)}
  before(:each) do
    @ride = FactoryBot.create(:ride, user_id: user.id)
  end

  it "renders the edit ride form" do
    render

    assert_select "form[action=?][method=?]", edit_ride_path(@ride), "post" do
    end
  end
end
