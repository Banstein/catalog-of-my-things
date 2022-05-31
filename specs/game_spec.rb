require './game.rb'

describe Game do
  context 'Test can_be_archived method in Game class' do  
    it "Test if it can return true if game can be archived" do
      game = Game.new('12-12-1999', true, true, '12-12-2019')
      expect(game.can_be_archived?).to be(true)
    end

    it "Test if it returns false if parent cannot be archived" do
      game = Game.new('12-12-2020', true, true, '12-12-2021')
      expect(game.can_be_archived?).to be(false)
    end

    it "Test if it returns false if child cannot be archived" do
      game = Game.new('12-12-1995', true, true, '12-12-2021')
      expect(game.can_be_archived?).to be(false)
    end
  end
end