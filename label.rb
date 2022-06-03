require_relative 'item'

class Label
  attr_accessor :title, :color
  attr_reader :items, :id

  def initialize(title, color)
    @id = rand(1...1000)
    @title = title
    @color = color
    @items = []
  end

  def add_item(new_item)
    @items << new_item
    new_item.label = self
  end
end
