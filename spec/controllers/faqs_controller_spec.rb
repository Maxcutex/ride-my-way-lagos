require 'rails_helper'

RSpec.describe FaqsController, type: :controller do

  let(:valid_attributes) {
    attributes_for(:faq)
  }

  let(:invalid_attributes) {
    {
      'is_active' => true,
      'title' => 'This is a title'
    }
  }
  let!(:faq) { create(:faq) }
  let(:valid_session) { {} }

  describe 'GET #index' do
    it 'returns a success response' do
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      get :show, params: {id: faq.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'GET #new' do
    it 'returns a success response' do
      get :new, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'GET #edit' do
    it 'returns a success response' do
      get :edit, params: { id: faq.to_param }, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Faq' do
        expect {
          post :create, params: { faq: valid_attributes }, session: valid_session
        }.to change(Faq, :count).by(1)
      end

      it 'redirects to the created faq' do
        post :create, params: { faq: valid_attributes }, session: valid_session
        expect(response).to redirect_to(Faq.last)
      end
    end

    context 'with invalid params' do
      it 'returns a success response (i.e. to display the [new] template)' do
        post :create, params: { faq: invalid_attributes }, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) {
        {
          'title' => 'My new Title',
          'answer' => 'My new Answer'
        }
      }

      it 'updates the requested faq' do
        put :update, params: { id: faq.id, faq: new_attributes }, session: valid_session
        faq.reload
        expect(faq.answer).to eq('My new Answer')
      end

      it 'redirects to the faq' do
        put :update, params: { id: faq.to_param, faq: valid_attributes }, session: valid_session
        expect(response).to redirect_to(faq)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested faq' do
      expect {
        delete :destroy, params: { id: faq.to_param }, session: valid_session
      }.to change(Faq, :count).by(-1)
    end

    it 'redirects to the faqs list' do
      delete :destroy, params: { id: faq.to_param }, session: valid_session
      expect(response).to redirect_to(faqs_url)
    end
  end
end
