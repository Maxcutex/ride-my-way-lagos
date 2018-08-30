require 'rails_helper'

RSpec.describe Role, type: :model do
  it { should have_many(:users).dependent(:destroy) }
  # Validation tests
  # ensure columns title and created_by are present before saving
  it { should validate_presence_of(:role_name) }
  it { should validate_presence_of(:role_description) }

  it 'is invalid with all fields' do
    role = Role.create(role_name: 'Administrator', role_description: 'Administrator of application')
    expect(role).to be_valid
  end

  it 'is invalid without role name' do
    role = Role.create(role_name: nil, role_description: 'Administrator of application')
    expect(role).to be_invalid
  end

  it 'is invalid without role description' do
    role = Role.create(role_name: 'administrator', role_description: nil)
    expect(role).to be_invalid
  end
end
