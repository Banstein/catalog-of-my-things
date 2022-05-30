class Genre
  attr_reader :id, :items
  attr_accessor :name

  def initialize(name)
    super()
    @id = rand(1...1000)
    @name = name
    @items = []
  end

  def add_item(genre)
    items << genre
    item.genre = self
  end
end
