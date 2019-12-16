require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  describe 'GET index' do
    it 'assigns @article' do
      article = FactoryBot.create(:article)
      get :index
      expect(assigns(:articles)).to eq([article])
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end
  end

  describe 'GET show' do
    it 'assigns @article' do
      article = FactoryBot.create(:article)
      get :show
      expect(assigns(:articles)).to eq(article)
    end

    it 'renders the show template' do
      get :show
      expect(response).to render_template('show')
    end
  end

  describe 'GET new' do
    # des tests
  end

  describe 'GET edit' do
    # des tests
  end

  describe 'POST create' do
    context 'with valid attributes' do
      it 'create a new article' do
        expect do
          post :create, article: FactoryBot.attributes_for(:article)
        end.to change(Event, :count).by(1)
      end

      it 'redirect to the article index' do
        post :create, article: FactoryBot.attributes_for(:article)
        response.should redirect_to Article.index
      end
    end
  end

  describe 'PUT update' do
    # des tests
  end

  describe 'DELETE destroy' do
    # des tests
  end
end