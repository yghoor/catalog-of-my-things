require_relative './spec_helper'

describe Item do
  before :each do
    @item = Item.new('15/12/2001')
  end

  context '#new' do
    it 'takes one parameter and returns a Item object' do
      expect(@item).to be_instance_of(Item)
    end

    context 'applies default values to the rest of the parameters' do
      it 'sets the label to nil' do
        expect(@item.label).to eq(nil)
      end

      it 'sets the source to nil' do
        expect(@item.source).to eq(nil)
      end

      it 'sets the author to nil' do
        expect(@item.author).to eq(nil)
      end

      it 'sets the genre to nil' do
        expect(@item.genre).to eq(nil)
      end
    end
  end

  context '#move_to_archive' do
    it 'changes the archived attribute to true if the item can be archived' do
      @item.move_to_archive
      expect(@item.instance_variable_get(:@archived)).to eq(true)
    end

    it 'does not change the archived attribute to true if the item can not be archived' do
      item = Item.new('15/12/2015')
      item.move_to_archive
      expect(item.instance_variable_get(:@archived)).to eq(false)
    end
  end
end

describe 'Many-to-one relationship with Label class' do
  context 'when a Label is set in an Item' do
    before :each do
      @label = Label.new('title', 'color')
      @item = Item.new('15/12/2001')
      @item.label = @label
    end

    it 'the item\'s label attribute is set to the label' do
      expect(@item.label).to eq(@label)
    end

    it 'item is added to the label\'s items array' do
      @item.label = @label
      expect(@label.items).to include(@item)
    end
  end
end