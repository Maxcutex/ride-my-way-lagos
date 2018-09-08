require 'rails_helper'
require_relative '../support/helper_forms/login_form'
require_relative '../support/helper_forms/subscribe_ride_form'
require_relative '../support/helper_forms/unsubscribe_ride_form'

RSpec.feature "Followers", type: :feature do
  let(:subscribe_ride_form) { SubscribeRideForm.new }
  let(:login_form) { LoginForm.new }
  let(:unsubscribe_form) { UnsubscribeRideForm.new }
  let(:user) { create(:user) }
  let(:user1) { create(:user) }
  let!(:ride) { create(:ride, user: user, start_location: 'Epic Tower', end_location: 'Yaba') }
  let!(:ride1) { create(:ride, user: user1, start_location: 'Victoria Island, Eko Hotel', end_location: 'Epic Tower') }
  let!(:follower) { create(:follower, ride: ride, user: user1)}

  background do
    login_form.visit_page.login_as(user)
  end

  scenario 'subscribe to Ride with valid data' do
    subscribe_ride_form.visit_page(ride1.id, 'new', 0).fill_in_with(
        pick_up_location: 'Yaba'
    ).submit

    expect(page).to have_content('You have successfully subscribed to the ride')
    expect(Follower.last.pick_up_location).to eq('Yaba')
  end

  scenario 'edit subscription with valid data' do
    subscribe_ride_form.visit_page(ride.id, 'edit', follower.id ).fill_in_with(
      pick_up_location: 'Shomolu1'
    ).submit

    expect(page).to have_content('You have successfully updated your position on the ride.')
    expect(Follower.get_by_id(follower.id).pick_up_location).to eq('Shomolu1')
  end
end
