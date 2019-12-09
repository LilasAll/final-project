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
      expect(@comment).to be_a(Comment)
    end

    describe '#content' do
      it { expect(@comment).to validate_presence_of(:content) }
    end

  end

  context 'associations' do
    describe 'some association' do
      it { expect(@comment).to belong_to(:event) }
      it { expect(@comment).to belong_to(:user) }
    end
  end

  context 'callbacks' do
    describe 'some callbacks' do
      # teste ce callback
    end
  end

  context 'public instance methods' do
    describe '#content' do
      it 'should return a string' do
        expect(@comment.content).to be_a(String)
      end
    end
  end

  context 'public class methods' do
    describe 'self.some_method' do
      # teste cette méthode
    end
  end
end
