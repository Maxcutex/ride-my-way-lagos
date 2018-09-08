require 'rails_helper'

RSpec.feature "Home", type: :feature do
  scenario 'With welcome message' do
    visit('/')
    expect(page).to have_content('Get Started')
  end
end
