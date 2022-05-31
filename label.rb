require_relative "item.rb"

class Label
  attr_accessor :title, :color
  attr_reader :items, :id

  def initialise(_id, title, color, _items)
    @id = id || rand(1...1000)
    @title = title
    @color = color
    @items = []
  end

  def add_item(new_item)
    @items << new_item
    new_item.label == self
  end
end
