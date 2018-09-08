require 'rails_helper'

RSpec.describe 'followers/edit', type: :view do
  let(:user) { create(:user) }

  before(:each) do
    @ride = create(:ride, user_id: user.id)
    @follower = assign(:follower, Follower.create!(
      :ride_id => @ride.id,
      :user_id => user.id, :will_ride => true))
    sign_in(user)
  end

  it 'renders the edit follower form' do
    render
    assert_select 'form input' do
      assert_select '[name=?]', 'follower[pick_up_location]'
    end
  end
end
