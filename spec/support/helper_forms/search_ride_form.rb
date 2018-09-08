class SearchRideForm
  include Capybara::DSL

  def visit_page
    visit('/rides/find')
    self
  end

  def fill_in_with(search_value)
    within '#nifty_form' do
      fill_in('search_value', with: search_value)
      select('Both', from: 'option')
    end
    

    self
  end

  def submit
    click_on('Search Ride')
    self
  end
end
