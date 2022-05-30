class Genre
  attr_reader :id, :items
  attr_accessor :name

  def initialize(name)
    super()
    @id = rand(1...1000)
    @name = name
    @items = []
  end

  def add_item(music_genre)
    items << music_genre
    music_genre.genre = self
  end
end
