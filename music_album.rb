require './item'

class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialize(date, archived: false, on_spotify: false)
    super(date, archived)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    super && @on_spotify = true
  end
end
