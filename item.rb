require 'date'

class Item
  attr_accessor  :publish_date, :archived, :genre, :author, :label
  attr_reader :id, 

  def initialize(date, archived: false)
    @id = rand(1...1000)
    @publish_date = date
    @archived = archived
  end

  def add_genre=(genre)
    @genre = genre
    genre.add_item(self) unless genre.items.include? self
  end

  def add_author=(author)
    @author = author
    author.add_item(self) unless author.items.include? self
  end

  def add_label(label)
    @label << label
  end

  def can_be_archived?
    converted = Date.strptime(@publish_date, '%d-%m-%Y')
    (Time.now.year - converted.year) > 10
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end
end
