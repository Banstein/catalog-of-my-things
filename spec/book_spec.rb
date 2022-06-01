require './book'
require './item'

describe Book do
  before :each do
    @book = Book.new 'Publisher', 'Cover state', 'Publish date'
  end

  describe '#new' do
    it 'takes two parameters and returns a Book object' do
      @book.should be_an_instance_of Book
    end
  end

  describe '#publisher' do
    it 'detects the right publisher' do
      expect(@book.publisher).to eq 'Publisher'
    end
  end

  describe '#cover_state' do
    it 'detects the right cover_state' do
      expect(@book.cover_state).to eq 'Cover state'
    end
  end

  describe '#publish_date' do
    it 'detects the right publish_date' do
      expect(@book.publish_date).to eq 'Publish date'
    end
  end

  describe '#can_be_archived?' do
    it 'Test if it can return true if book can be archived' do
      book = Book.new('bahnas', 'good', '12-12-2010')
      expect(book.can_be_archived?).to be(true)
    end

    it 'Test if it can return false if book cannot be archived' do
      book = Book.new('bahnas', 'good', '12-12-2019')
      expect(book.can_be_archived?).to be(false)
    end

    it 'Test if it can return false if book can be archived' do
      book = Book.new('bahnas', 'bad', '12-12-2019')
      expect(book.can_be_archived?).to be(true)
    end
  end
end
