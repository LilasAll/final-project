# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Conversation, type: :model do
  before(:each) do
    @conversation = FactoryBot.create(:conversation)
  end

  it 'has a valid factory' do
    expect(build(:conversation)).to be_valid
  end

  context 'validations' do
    it 'is valid with valid attributes' do
      expect(@conversation).to be_a(Conversation)
    end

    describe '#sender_id' do
      it { expect(@conversation).to validate_presence_of(:sender_id) }
    end

    describe '#recipient_id' do
      it { expect(@conversation).to validate_presence_of(:recipient_id) }
    end
  end

  context 'associations' do
    # teste association
  end

  context 'callbacks' do
    describe 'some callbacks' do
      # teste ce callback
    end
  end

  context 'public instance methods' do
    describe '#content' do
      it 'should return a string' do
      end
    end
  end

  context 'public class methods' do
    describe 'self.some_method' do
      # teste cette méthode
    end
  end
end
