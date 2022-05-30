require './item'

attr_accessor :on_spotify

class MusicAlbum < Item
  def initialize(on_spotify: false)
    super()
    @on_spotify = on_spotify
  end

  def can_be_archieved?(item)
    item.can_be_archieved? && on_spotify = true
  end
end
