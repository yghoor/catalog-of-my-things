require_relative './spec_helper'

describe Label do
  before :each do
    @label = Label.new('title', 'color')
  end

  context '#new' do
    it 'takes two parameters and returns a Label object' do
      expect(@label).to be_instance_of(Label)
    end
  end

  context '#title' do
    it 'returns the correct label' do
      expect(@label.title).to eq('title')
    end
  end

  context '#color' do
    it 'returns the correct color' do
      expect(@label.color).to eq('color')
    end
  end

  context '#items' do
    it 'returns an empty array just after initialization' do
      expect(@label.items).to eq([])
    end
  end
end

