require './genre'
require './item'

describe Genre do
  before :each do
    @genre = Genre.new 'Victor'
  end

  context '#new' do
    it 'should takes one parameters and returns a genre object' do
      expect(@genre.instance_of?(Genre)) == true
    end
  end

  context 'Genre to return list of items' do
    it 'Items should return empty array' do
      expect(@genre.items.length).to eql 0
    end

    it 'Items should return array of length one(1)' do
      item = Item.new('2022-04-04')
      @genre.add_item(item)
      expect(@genre.items.length).to eql 1
    end
  end

  context '#name' do
    it 'should returns the correct name' do
      expect(@genre.name).to eql 'Victor'
    end
  end
end
