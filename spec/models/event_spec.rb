# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Event, type: :model do
  before(:each) do
    @event = FactoryBot.create(:event)
  end

  it 'has a valid factory' do
    expect(build(:event)).to be_valid
  end

  context 'validations' do
    it 'is valid with valid attributes' do
      expect(@event).to be_a(Event)
    end

    describe '#title' do
      it { expect(@event).to validate_presence_of(:title) }
      it { expect(@event.title).to be_a(String) }
    end

    describe '#description' do
      it { expect(@event).to validate_presence_of(:description) }
      it { expect(@event.description).to be_a(String) }
      # it { expect(@event.description).to validate_length_of(:description).is_at_least(10).is_at_most(1000).with_message("La description doit contenir entre 10 et 1000 caractères.") }
    end

    describe '#location' do
      it { expect(@event).to validate_presence_of(:location) }
      it { expect(@event.location).to be_a(String) }
    end
  end

  context 'associations' do
    describe 'some association' do
      # it { expect(@user).to have_many(:events) }
    end
  end

  context 'callbacks' do
    describe 'some callbacks' do
      # teste ce callback
    end
  end

  context 'public instance methods' do
    describe '#title' do
      it 'should return a string' do
        expect(@event.title).to be_a(String)
      end
    end
  end

  context 'public class methods' do
    describe 'self.some_method' do
      # teste cette méthode
    end
  end
end
