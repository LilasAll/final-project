require 'rails_helper'

RSpec.describe User, type: :model do

  before(:each) do 
    @user = FactoryBot.create(:user)
  end

  it "has a valid factory" do
    expect(build(:user)).to be_valid
  end


  context "validations" do

    it "is valid with valid attributes" do
      expect(@user).to be_a(User)
    end

    describe "#email" do
     it { expect(@user).to validate_presence_of(:email) } 
    end

    describe "#pseudo" do
     it { expect(@user).to validate_presence_of(:pseudo) } 
    end

    describe "#first_name" do
     it { expect(@user).to validate_presence_of(:first_name) } 
    end

  end


  context "associations" do

    describe "some association" do
      it { expect(@user).to have_many(:events) }
    end

  end


  context "callbacks" do

    describe "some callbacks" do
      # teste ce callback
    end

  end


  context "public instance methods" do

    describe "#pseudo" do
      
      it "should return a string" do
        expect(@user.pseudo).to be_a(String)
      end
    
    end

  end


  context "public class methods" do

    describe "self.some_method" do
      # teste cette méthode
    end

  end

end