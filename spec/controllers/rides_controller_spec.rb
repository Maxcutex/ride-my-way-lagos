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
  let!(:ride) { FactoryBot.create(:ride) }

  shared_examples 'public access to rides' do
    describe 'GET index' do
      it 'renders :index template' do
        get :index
        expect(response).to render_template(:index)
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

    describe 'GET show' do
      let(:ride) { FactoryBot.create(:ride)}

      it 'renders :show template' do
        get :show, params: { id: ride.to_param }
        expect(response).to render_template(:show)
      end

      it 'assigns requested ride to @ride' do
        get :show, params: { id: ride.to_param }
        expect(assigns(:ride)).to eq(ride)
      end
    end
  end

  describe 'guest user' do

    it_behaves_like 'public access to rides'

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
  end

  context 'Non owner for the ride ' do
    let(:user1) { FactoryBot.create(:user) } 
    let(:user) { FactoryBot.create(:user) }
    let!(:ride) { FactoryBot.create(:ride, user: user)}
    let(:ride2) { FactoryBot.create(:ride, user: user, start_location: 'ET', end_location: 'Yaba')}
    let(:ride1) { FactoryBot.create(:ride, user: user, start_location: 'VI', end_location: 'ET')}
    before do
      sign_in(user1)
    end
    describe 'GET #subscribed_rides' do
      it 'returns a success response' do
        get :subscribed_rides, params: { user_id: user1.to_param }, session: valid_session
        expect(response).to be_successful
      end
    end

    describe 'GET #find ride' do
      it 'returns a success response' do
        get :find, params: {}, session: valid_session
        expect(response).to be_successful
      end

      it 'with search value returns a success response' do
        
        get :search, params: { search_value: 'ET'}, session: valid_session
        expect(response).to be_successful
      end
      
      
    end

  end

  context 'The owner for the ride ' do
    before do
      sign_in(user)
    end

    let(:user) { FactoryBot.create(:user) }
    let!(:ride) { FactoryBot.create(:ride, user: user)}

    describe 'GET #new' do
      it 'returns a success response' do
        get :new, params: {}, session: valid_session
        expect(response).to be_successful
      end
    end

    describe 'GET #created_rides' do
      it 'returns a success response' do
        get :created_rides, params: {  user_id: user.to_param }, session: valid_session
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
          ride_atr = FactoryBot.attributes_for_with_foreign_keys(:ride) 
          expect { Ride.create(ride_atr) }.to change{ Ride.count }.by(1)
          expect {
            post :create, params: { ride: FactoryBot.attributes_for_with_foreign_keys(:ride) }, session: valid_session
          }.to change(Ride, :count).by(1)
        end
        it 'redirects to the created ride' do
          post :create, params: { ride: FactoryBot.attributes_for_with_foreign_keys(:ride) }, session: valid_session
          expect(response).to redirect_to(ride_path(assigns[:ride]))

        end
        it 'creates new ride in database' do
          expect {
            post :create, params: { ride: FactoryBot.attributes_for_with_foreign_keys(:ride) }
          }.to change(Ride, :count).by(1)
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
            'start_location' => 'New Start Location',
            'end_location' => 'New End Location',
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
          expect(ride.start_location).to eq('New Start Location')
        end

        it 'redirects to the ride' do
          put :update, params: { id: ride.id, ride: FactoryBot.attributes_for(:ride) }, session: valid_session
          expect(response).to redirect_to(ride)
        end
      end

      context 'with invalid params' do
        it 'returns a success response (i.e. to display the "edit" template)' do
          put :update, params: { id: ride.id, ride: FactoryBot.attributes_for(:ride)}, session: valid_session
          expect(response).to redirect_to ride_path(ride.id)
        end
      end
    end
  end
end
