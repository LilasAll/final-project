# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Message, type: :model do
  before(:each) do
    @message = FactoryBot.create(:message)
  end

  it 'has a valid factory' do
    expect(build(:message)).to be_valid
  end

  context 'validations' do
    it 'is valid with valid attributes' do
      expect(@message).to be_a(Message)
    end

    describe '#body' do
      it { expect(@message).to validate_presence_of(:body) }
    end
  end

  context 'associations' do
    describe 'some association' do
      it { expect(@message).to belong_to(:conversation) }
      it { expect(@message).to belong_to(:user) }
    end
  end

  context 'callbacks' do
    describe 'some callbacks' do
      # teste ce callback
    end
  end

  context 'public instance methods' do
    describe '#body' do
      it 'should return a string' do
        expect(@message.body).to be_a(String)
      end
    end
  end

  context 'public class methods' do
    describe 'self.some_method' do
      # teste cette méthode
    end
  end
end
