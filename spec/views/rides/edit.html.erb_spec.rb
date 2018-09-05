require 'rails_helper'

RSpec.describe "rides/edit", type: :view do
  let(:user) { create(:user)}
  before(:each) do
    @ride = create(:ride, user: user)
  end

  it "renders the edit ride form" do
    
    render

    assert_select "form[action=?][method=?]", "/rides/#{@ride.id}", "POST" do
    end
  end
end
