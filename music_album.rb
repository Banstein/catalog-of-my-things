require './item'

class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialize(date, on_spotify)
    super(date, archived: archived)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    super && @on_spotify = true
  end
end
