class UnsubscribeRideForm
  include Capybara::DSL

  def visit_page(ride_id,id)
    visit("/rides/#{ride_id}/followers/new")
    self
  end

  def fill_in_with(params = {})
    fill_in('follower[comment]',
      with: params.fetch(:comment, 'i have another ride')
    )
    self
  end

  def submit
    click_on('Subscribe')
    self
  end
end
