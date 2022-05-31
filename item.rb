class Item
  attr_accessor :genre, :author, :source, :publish_date, :archived
  attr_reader :id, :label

  def initialize(date, archived: false)
    @id = rand(1...1000)
    @publish_date = date
    @archived = archived

    @genre = []
    @source = []
    @author = []
  end

  def add_genre(genre)
    @genre << genre
  end

  def add_author(author)
    @author << author
  end

  def label=(label)
    @label = label
    label.add_item(self) unless label.items.include?(self)
  end

  def can_be_archived?
    converted = Date::strptime(@publish_date, "%d-%m-%Y")
    (Time.now.year - converted.year) > 10
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end
end
