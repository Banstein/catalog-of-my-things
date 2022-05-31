class Item
  attr_accessor :genre, :author, :source, :label, :publish_date, :archived
  attr_reader :id

  def initialize(date, archived: false)
    @id = rand(1...1000)
    @publish_date = date
    @archived = archived
    @genre = []
    @source = []
    @label = []
  end

  def add_genre(genre)
    @genre << genre
  end

  def add_source(source)
    @source << source
  end

  def add_author(author)
    @author = author
    author.add_item(self) unless author.items.include? self
  end

  def add_label(label)
    @label << label
  end

  def can_be_archived?
    converted = Date::strptime(@publish_date, "%d-%m-%Y")
    (Time.now.year - converted.year) > 10
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end
end
