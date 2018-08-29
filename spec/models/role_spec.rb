require 'rails_helper'

RSpec.describe Role, type: :model do
  it { should have_many(:users).dependent(:destroy) }
  # Validation tests
  # ensure columns title and created_by are present before saving
  it { should validate_presence_of(:role_name) }
  it { should validate_presence_of(:role_description) }
end
