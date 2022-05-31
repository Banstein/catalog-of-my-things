require_relative 'item.rb'

class Book < Item
  def initialize(publisher, cover_stat)
    @puplisher = publisher
    @cover_stat = cover_stat
  end

  def can_be_archived?
    super || @cover_stat == "bad"
  end
end