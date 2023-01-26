require_relative './item'

class Book < Item
  attr_accessor :publisher, :cover_state
  attr_reader :id

  def initialize(publisher, cover_state)
    super(id = Random.rand(1..100))
    @id = id
    @publisher = publisher
    @cover_state = cover_state
  end

  private

  def can_be_archived?
    @archived = if super or @cover_state == 'bad'
                  true
                else
                  false
                end
  end
end
