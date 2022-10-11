require_relative './spec_helper'

describe Book do
  before :each do
    @book = Book.new('publisher', 'cover state', '15/12/2001')
  end

  context '#new' do
    it 'takes one parameter and returns a Book object' do
      expect(@book).to be_instance_of(Book)
    end

    context 'applies default values to the rest of the parameters' do
      it 'sets the label to nil' do
        expect(@book.label).to eq(nil)
      end

      it 'sets the source to nil' do
        expect(@book.source).to eq(nil)
      end

      it 'sets the author to nil' do
        expect(@book.author).to eq(nil)
      end

      it 'sets the genre to nil' do
        expect(@book.genre).to eq(nil)
      end
    end
  end

  context '#publisher' do
    it 'returns the publisher of the book' do
      expect(@book.publisher).to eq('publisher')
    end
  end

  context '#cover_state' do
    it 'returns the cover state of the book' do
      expect(@book.cover_state).to eq('cover state')
    end
  end

  context '#move_to_archive' do
    it 'changes the archived attribute to true if the Book is older than 10 years old' do
      book = Book.new('publisher', 'cover state', '15/12/2001')
      book.move_to_archive
      expect(book.instance_variable_get(:@archived)).to eq(true)
    end

    it 'changes the archived attribute to true if the Book cover state is \'bad\'' do
      book = Book.new('publisher', 'bad', '15/12/2020')
      book.move_to_archive
      expect(book.instance_variable_get(:@archived)).to eq(true)
    end

    it 'does not change the archived attribute to true if the Book is not older than 10 years old' do
      book = Book.new('publisher', 'cover state', '15/12/2020')
      book.move_to_archive
      expect(book.instance_variable_get(:@archived)).to eq(false)
    end

    it 'does not change the archived attribute to true if the Book cover state is \'good\'' do
      book = Book.new('publisher', 'good', '15/12/2020')
      book.move_to_archive
      expect(book.instance_variable_get(:@archived)).to eq(false)
    end
  end
end
