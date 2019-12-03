require 'rails_helper'

RSpec.describe Article, type: :model do

  before(:each) do 
    @article = FactoryBot.create(:article)
  end

  it "has a valid factory" do
    expect(build(:article)).to be_valid
  end


  context "validations" do

    it "is valid with valid attributes" do
      expect(@article).to be_a(Article)
    end

    describe "#title" do
     it { expect(@article).to validate_presence_of(:title) } 
    end

    describe "#content" do
     it { expect(@article).to validate_presence_of(:content) } 
    end

  end


  context "associations" do

    describe "some association" do
      #it { expect(@user).to have_many(:events) }
    end

  end


  context "callbacks" do

    describe "some callbacks" do
      # teste ce callback
    end

  end


  context "public instance methods" do

    describe "#title" do
      
      it "should return a string" do
        expect(@article.title).to be_a(String)
      end
    
    end

  end


  context "public class methods" do

    describe "self.some_method" do
      # teste cette méthode
    end

  end

end