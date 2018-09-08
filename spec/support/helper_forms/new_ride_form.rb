class NewRideForm
  include Capybara::DSL

  def visit_page
    visit('/')
    click_on('Create A Ride')
    self
  end

  def fill_in_with(params = {})
    fill_in('ride[start_location]', with: params.fetch(:start_location, 'Shomolu'))
    fill_in('ride[end_location]', with: 'Epic Tower')

    select('20', from: 'date[day]')
    select('September', from: 'date[month]')
    select('2018', from: 'date[year]')


    select('20', from: 'ride[hour]')
    select('14', from: 'ride[minutes]')
    select('4', from: 'ride[rider_count]')

    fill_in 'comment', with: 'i usually leave on time'

    self
  end

  def submit
    click_on('Set Up Ride')
    self
  end
end
