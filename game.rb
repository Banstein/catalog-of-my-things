require './item'
require 'date'

class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(date, archived, multiplayer, last_played_at)
    super(date, archived: archived)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def can_be_archived?
    last_played_date = Date.strptime(@last_played_at, '%d-%m-%Y')
    difference_in_years = (Time.now.year - last_played_date.year)
    return true if super && difference_in_years > 2
  end
end
