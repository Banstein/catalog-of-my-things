require './label'
require './item'
require './book'

describe Label do
  before :each do
    @label = Label.new 'Title', 'Color'
  end

  describe '#new' do
    it 'takes two parameters and returns a Label object' do
      @label.should be_an_instance_of Label
    end
  end

  describe '#title' do
    it 'detects the title of label' do
      expect(@label.title).to eq 'Title'
    end
  end

  describe '#color' do
    it 'detects the color of label' do
      expect(@label.color).to eq 'Color'
    end
  end

  it 'should detect the label items' do
    book = Book.new 'Publisher', 'Cover state', 'Publish date'
    @label.add_item(book)
    expect(@label.items.include?(book)).to eq true
    expect(book.label).to eq @label
  end

  context 'Genre to return list of items' do
    it 'Items should return array of length one(1)' do
      item = Item.new('2022-04-04')
      @label.add_item(item)
      expect(@label.items.length).to eql 1
    end
  end
end
