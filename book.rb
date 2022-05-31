require_relative 'item'

class Book < Item
  def initialize(publisher, cover_stat)
    super(publish_date, archived: archived)
    @puplisher = publisher
    @cover_stat = cover_stat
  end

  def can_be_archived?
    super || @cover_stat == 'bad'
  end
end
