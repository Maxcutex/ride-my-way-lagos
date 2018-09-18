require 'rails_helper'
require 'shared_contexts'

RSpec.describe "Rides", type: :request do
  let(:user1) { create(:user, password: 'password', password_confirmation: 'password') }
  let(:user) { create(:user) }
  let!(:ride) { create(:ride, user: user)}
  let(:ride2) { create(:ride, user: user, start_location: 'ET', end_location: 'Yaba')}
  let(:ride1) { create(:ride, user: user, start_location: 'VI', end_location: 'ET')}
  # before do
  #   sign_in(user1)
  # end
  # xdescribe 'GET /rides' do
  #   it 'works! (now write some real specs)' do
  #     get rides_path
  #     expect(response).to have_http_status(200)
  #   end
  # end
end
