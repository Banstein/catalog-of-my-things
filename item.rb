class Item

attr_accessor :genre, :author, :source, :label, :publish_date

  def initialize(date, archived: false)
    @id = rand(1..1000)
    @publish_date = date
    @archived = archived
  end

  def can_be_archived?
    @publish_date > 10
  end

  def move_to_archive
    @archived = true if self.can_be_archived?
  end
end