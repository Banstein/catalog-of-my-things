class Item

attr_accessor :genre, :author, :source, :label

  def initialize(date, archived: false)
    @id = rand(1..1000)
    @publish_date = date
    @archived = archived
  end
end