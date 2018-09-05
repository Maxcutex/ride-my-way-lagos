require 'rails_helper'

RSpec.describe "rides/show", type: :view do
  let(:user) { FactoryBot.create(:user)}

  before(:each) do
    @ride = assign(:ride, FactoryBot.create(:ride, user_id: user.id))
  end

  it "renders attributes in <p>" do
    render
  end
end
