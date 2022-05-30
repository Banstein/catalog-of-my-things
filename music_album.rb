require './item'

attr_accessor :on_spotify

class MusicAlbum < Item
  def initialize(on_spotify: true)
    super()
    @on_spotify = on_spotify
  end
end
