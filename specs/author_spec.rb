require './author.rb'
require './game.rb'
require './item'

describe Author do
  context "Test add_item method" do
    it "Test if the author of item is the given author" do
      author = Author.new("Bonke", "Gcobo")
      game = Item.new("12-12-2020")
      author.add_item(game)
      expect(author.items[0].author).to eq(author)
    end
  end
end