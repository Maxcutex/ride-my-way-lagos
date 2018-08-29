require 'rails_helper'

RSpec.describe Ride, type: :model do
  it { should belong_to(:user) }
  it { should validate_presence_of(:start_location) }
  it { should validate_presence_of(:end_location) }
  it { should validate_presence_of(:rider_count) }
  it { should validate_presence_of(:date_ride) }
  it { should have_many(:followers).dependent(:destroy) }
end
