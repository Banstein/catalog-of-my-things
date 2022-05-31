require './author.rb'
require './game.rb'

describe Author do
  context "Test add_item method" do
    it "Test if we can add item in author" do
      author = Author.new("Bonke", "Gcobo")
      item_string = author.add_item("A string")
      expect(author.items.length()).to eq(1)
    end

    it "Test if we can add item of class game in author" do
      author = Author.new("Bonke", "Gcobo")
      game = Game.new('12-12-1999', true, true, '12-12-2019')
      author.add_item(game)
      expect(author.items[0]).to be_a Game
    end
  end
end