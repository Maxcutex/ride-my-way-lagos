require 'rails_helper'


RSpec.describe FollowersController, type: :controller do

  
  let(:user) { create(:user)}
  let(:user1) { create(:user)}
  let(:ride) { create(:ride, user: user)}
  let(:ride2) { create(:ride)}
  let!(:follower) { create(:follower, ride: ride, user: user1)}
  let!(:follower2) { create(:follower, ride: ride2)}
  let(:valid_attributes) {
    FactoryBot.attributes_for_with_foreign_keys(:follower)
  }
  let(:valid_unsubscribe_attributes) {
    {
      "will_ride" => false,
      "user_id" => user1.id,
      "ride_id" => ride.id,
      "pick_up_location" => 'My String',
      "comment" => "My comment"
    }
  }

  let(:invalid_attributes) {
    FactoryBot.attributes_for(:follower)
  }

  
  let(:valid_session) { {} }
  context 'logged in user ' do
    before do
      sign_in(user1)
    end
    describe 'GET #new' do
      it 'returns a success response' do
        get :new, params: {ride_id: ride.id}, session: valid_session
        expect(response).to be_successful
      end
    end
  
    describe 'GET #edit' do
      it 'returns a success response' do
        get :edit, params: {id: follower.to_param,ride_id: ride.id}, session: valid_session
        expect(response).to be_successful
      end
    end
  
    describe 'POST #create' do
      context 'with valid params' do
        it 'creates a new Follower' do
          expect {
            post :create, params: {follower: valid_attributes,ride_id: ride.id}, session: valid_session
          }.to change(Follower, :count).by(1)
        end
  
        it 'redirects to the created follower' do
          post :create, params: {follower: valid_attributes,ride_id: ride.id}, session: valid_session
          expect(response).to redirect_to(ride_path(id: ride.id))
        end
      end
  
      context 'with invalid params' do
        it "returns a success response (i.e. to display the 'new' template)" do
          post :create, params: {follower: invalid_attributes, ride_id: ride.id}, session: valid_session
          expect(response).to redirect_to(new_ride_path)
        end
      end
    end
  
    describe 'PUT #update' do
      context 'with valid params' do
        let(:new_attributes) {
          FactoryBot.attributes_for_with_foreign_keys(:follower)
        }
  
  
        it 'redirects to the follower' do
          put :update, params: {id: follower.to_param, follower: valid_attributes, ride_id: ride.id}, session: valid_session
          expect(response).to redirect_to(ride_path(id: ride.id))
        end
      end
  
      context 'with invalid params' do
        it "returns a success response (i.e. to display the 'edit' template)" do
          put :update, params: {id: follower.to_param, follower: invalid_attributes, ride_id: ride.id}, session: valid_session
          expect(response).to redirect_to(ride_path(id: ride.id))
        end
      end
    end

    describe 'DELETE #destroy' do
      it 'destroys the requested follower' do
        expect {
          delete :destroy, params: {id: follower.to_param, ride_id: ride.id}, session: valid_session
        }.to change(Follower, :count).by(-1)
      end
  
      it 'redirects to the followers list' do
        delete :destroy, params: {id: follower.to_param, ride_id: ride.id}, session: valid_session
        expect(response).to redirect_to(ride_path(id: ride.id))
      end
    end

    describe 'Unsubscribe from a ride' do
      context 'only a subscribed user' do
        it 'can unsubscribe from a ride' do
          put :remove, params: {
            id: follower.to_param, ride_id: ride.id,
            follower: valid_unsubscribe_attributes
          }, session: valid_session
          expect(response).to redirect_to(ride_path(id: ride.id))
        end
      end

      context 'an unsubscribed user' do
        it 'cannot unsubscribe from a ride' do
          put :remove, params: {
            id: 298, ride_id: ride2.id,
            follower: valid_attributes
          }, session: valid_session
          expect(response).to redirect_to(ride_path(id: ride2.id))
        end
      end
    end
  end
end
