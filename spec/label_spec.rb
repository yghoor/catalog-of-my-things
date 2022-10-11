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

describe 'One-to-many relationship with Item class' do
  context 'when an Item is added to a Label' do
    before :each do
      @label = Label.new('title', 'color')
      @item = Item.new('15/12/2001')
      @label.add_item(@item)
    end

    it 'the item is added to the label\'s items array' do
      expect(@label.items).to include(@item)
    end

    it 'the items\'s label attribute is set to the label' do
      expect(@item.label).to eq(@label)
    end
  end
end