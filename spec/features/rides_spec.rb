require 'rails_helper'
require_relative '../support/helper_forms/login_form'
require_relative '../support/helper_forms/new_ride_form'
require_relative '../support/helper_forms/edit_ride_form'
require_relative '../support/helper_forms/search_ride_form'

RSpec.feature "Rides", type: :feature do
  let(:new_ride_form) { NewRideForm.new }
  let(:edit_ride_form) { EditRideForm.new }
  let(:login_form) { LoginForm.new }
  let(:search_form) { SearchForm.new }
  let(:user) { create(:user) }
  let!(:ride) { create(:ride, start_location: 'Epic Tower', end_location: 'Yaba') }
  let!(:ride1) { create(:ride, start_location: 'Victoria Island, Eko Hotel', end_location: 'Epic Tower') }


  background do
    login_form.visit_page.login_as(user)
  end
  context 'can search for  data' do
    scenario 'that exists' do
      search_form.visit_page.fill_in_with('Epic').submit
      expect(page).to have_content('Epic Tower')
    end

    scenario 'that doesnt exist' do
      search_form.visit_page.fill_in_with('Bariga').submit
      expect(page).to have_no_content('Bariga')
    end
  end
  scenario 'create new Ride with valid data' do
    new_ride_form.visit_page.fill_in_with(
        start_location: 'Shomolu'
    ).submit

    expect(page).to have_content('Ride was successfully created.')
    expect(Ride.last.start_location).to eq('Shomolu')
  end

  scenario 'cannot create Ride with invalid data' do
    new_ride_form.visit_page.submit
    expect(page).to have_content("can't be blank")
  end

  scenario 'edit Ride with valid data' do
    edit_ride_form.visit_page(ride.id).fill_in_with(
        start_location: 'Shomolu1'
    ).submit

    expect(page).to have_content('Ride was successfully updated.')
    expect(Ride.find_by_id(ride.id).start_location).to eq('Shomolu1')
  end

  scenario 'cannot edit Ride with invalid data' do
    edit_ride_form.visit_page(ride.id).fill_in_with(
      start_location:  nil
  ).submit
    expect(page).to have_content("can't be blank")
  end

 
end
