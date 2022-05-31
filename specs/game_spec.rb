require './game.rb'

describe Game do
  context 'Test can_be_archived method in Game class' do  
  game = Game.new('12-12-1999', true, true, '12-12-2019')
    it "Test if it can return true if game can be archived" do
     expect(game.can_be_archived?).to be(false)
    end
  end 
end