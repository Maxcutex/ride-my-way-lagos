require 'rails_helper'

RSpec.describe Faq, type: :model do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:answer) }
end
