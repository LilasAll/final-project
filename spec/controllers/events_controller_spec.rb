require 'rails_helper'

RSpec.describe EventsController, type: :controller do

 	describe "GET index" do

 		it "assigns @event" do
      event = FactoryBot.create( :event )
      get :index
      expect(assigns(:events)).to eq([event]) 
 		end 

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
 		
  end

  describe "GET show" do
    it "assigns @event" do
      event = FactoryBot.create( :event )
      get :show
      expect(assigns(:event)).to eq(event)
    end

    it "renders the show template" do
      get :show
      expect(response).to render_template("show")
    end
  end

  describe "GET new" do
    # des tests
  end

  describe "GET edit" do
    # des tests
  end

  describe "POST create" do
    context "with valid attributes" do
    	it "create a new event" do
    		expect {
    			post :create, event: FactoryBot.attributes_for(:event)
    		}.to change(Event,:count).by(1)
    	end

    	it "redirect to the event index" do
    		post :create, event: FactoryBot.attributes_for(:event)
    		response.should redirect_to Event.index
    	end
  	end

  end

  describe "PUT update" do
    # des tests
  end

  describe "DELETE destroy" do
    # des tests
  end

end