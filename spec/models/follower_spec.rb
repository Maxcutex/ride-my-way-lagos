require 'rails_helper'

RSpec.describe Follower, type: :model do
  it { should belong_to(:ride) }
  it { should belong_to(:user) }
end
