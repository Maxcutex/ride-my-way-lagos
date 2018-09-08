class SubscribeRideForm
  include Capybara::DSL

  def visit_page(ride_id,path, id=0)
    if path == 'new'
      visit("/rides/#{ride_id}/followers/new")
    else
      visit("/rides/#{ride_id}/followers/#{id}/edit")
    end
    self
  end

  def fill_in_with(params = {})
    fill_in('follower[pick_up_location]',
      with: params.fetch(:pick_up_location, 'Shomolu')
    )
    self
  end

  def submit
    click_on('Submit')
    self
  end
end
