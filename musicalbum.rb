require_relative './item'
require 'date'

class MusicAlbum < Item
  attr_accessor :on_spotify, :archived, :publish_date
  attr_reader :id

  def initialize(on_spotify, publish_date)
    super(id = Random.rand(1..100))
    @id = id
    @on_spotify = on_spotify == 'y'
    @publish_date = publish_date
    @archived = can_be_archived?
  end

  private

  def can_be_archived?
    super || @on_spotify ? true : false
  end
end
