require './author.rb'
require '.game.rb'

describe Author do
  context "Test add_item method" do
    it "Test if we can add item in author" do
      author = Author.new("Bonke", "Gcobo")
      item_string = author.add_item("A string")
      expect(author.items.length()).to eq(1)
    end
  end
end