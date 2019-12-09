# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Bug, type: :model do
  before(:each) do
    @bug = FactoryBot.create(:bug)
  end

  it 'has a valid factory' do
    expect(build(:bug)).to be_valid
  end

  context 'validations' do
    it 'is valid with valid attributes' do
      expect(@bug).to be_a(Bug)
    end

    describe '#content' do
      it { expect(@bug).to validate_presence_of(:content) }
    end

    describe '#user_name' do
      it { expect(@bug).to validate_presence_of(:user_name) }
    end

  end

  context 'associations' do
    describe 'some association' do
      #
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
        expect(@bug.content).to be_a(String)
      end
    end
  end

  context 'public class methods' do
    describe 'self.some_method' do
      # teste cette méthode
    end
  end
end
