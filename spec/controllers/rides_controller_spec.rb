require 'rails_helper'

RSpec.describe RidesController, type: :controller do
  let(:user) { FactoryBot.create(:user)}
  let(:valid_attributes) {
    FactoryBot.attributes_for(:ride)
  }

  let(:invalid_attributes) {
    {
      'end_location' => 'MyString',
      'is_active' =>  false, 'rider_count' => 1,
      'date_ride' => '2018-08-29', 'is_completed' => false,
      'comment' => 'MyString'
    }
  }

  let(:valid_session) { {} }
  let(:ride) { FactoryBot.create(:ride) }

  describe 'GET new' do
    it 'redirects to login page ' do
      get :new
      expect(response).to redirect_to new_user_session_url
    end
  end

  describe 'POST create' do
    it 'redirects to login page ' do
      post :create, params: { ride: FactoryBot.attributes_for(:ride) }
      expect(response).to redirect_to new_user_session_url
    end
  end
  describe 'GET edit' do
    it 'redirects to login page ' do
      get :edit, params: { id: FactoryBot.create(:ride).id }
      expect(response).to redirect_to new_user_session_url
    end
  end
  describe 'GET #index' do
    it 'returns a success response' do
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      get :show, params: { id: ride.to_param }, session: valid_session
      expect(response).to be_successful
    end
  end

  

  context 'is not the owner for the ride ' do
  end

  context 'is the owner for the ride ' do
    before do
      sign_in(user)
    end

    let(:user) { FactoryBot.create(:user) }
    let(:ride) { FactoryBot.create(:ride, user: user)}

    describe 'GET #new' do
      it 'returns a success response' do
        get :new, params: {}, session: valid_session
        expect(response).to be_successful
      end
    end

    describe 'GET #edit' do
      it 'returns a success response' do
        get :edit, params: { id: ride.to_param }, session: valid_session
        expect(response).to be_successful
      end
    end

    describe 'DELETE #destroy' do
      it 'destroys the requested ride' do
        expect {
          delete :destroy, params: { id: ride.id }, session: valid_session
        }.to change(Ride, :count).by(-1)
      end
      it 'redirects to the rides list' do
        delete :destroy, params: { id: ride.id }, session: valid_session
        expect(response).to redirect_to(rides_url)
      end
    end
    describe 'POST #create' do
      context 'with valid params' do
        it 'creates a new Ride' do
          # byebug.pry
          expect {
            post :create, params: { ride: FactoryBot.attributes_for(:ride) }, session: valid_session
          }.to change(Ride, :count).by(1)
        end
        it 'redirects to the created ride' do
          post :create, params: { ride: FactoryBot.attributes_for(:ride) }, session: valid_session
          expect(response).to redirect_to(Ride.last)
        end
      end

      context 'with invalid params' do
        it 'returns a success response (i.e. to display the "new" template)' do
          post :create, params: { ride: invalid_attributes}, session: valid_session
          expect(response).to be_successful
        end
      end
    end

    describe 'PUT #update' do
      context 'with valid params' do
        let(:new_attributes) {
          {
            'start_location' => 'MyString',
            'end_location' => 'MyString',
            'is_active' =>  false,
            'rider_count' => 1,
            'date_ride' => '2018-08-29',
            'is_completed' => false,
            'user' => user,
            'comment' => 'MyString'
          }
        }
        it 'updates the requested ride' do
          put :update, params: { id: ride.id, ride: new_attributes }, session: valid_session
          ride.reload
          skip('Add assertions for updated state')
        end

        it 'redirects to the ride' do
          put :update, params: { id: ride.id, ride: FactoryBot.attributes_for(:ride) }, session: valid_session
          expect(response).to redirect_to(ride)
        end
      end

      context 'with invalid params' do
        it 'returns a success response (i.e. to display the "edit" template)' do
          put :update, params: { id: ride.id, ride: invalid_attributes}, session: valid_session
          expect(response).to be_successful
        end
      end
    end
  end
end
