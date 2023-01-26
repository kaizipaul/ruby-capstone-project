require_relative './item'
require 'date'

class Genre < Item
  attr_accessor :name, :items
  attr_reader :id, :publish_date

  def initialize(name, publish_date)
    super(id = Random.rand(1..100))
    @id = id
    @name = name
    @publish_date = publish_date
    @items = []
  end

  def add_item(item)
    (item.is_a?(Item) && @items.include?(item)) || (@items << item)
    item.add_genre(self)
  end
end
