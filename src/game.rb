require 'date'
require_relative './item'

class Game < Item
  attr_accessor :multiplayer, :last_played_at, :publish_date
  attr_reader :id

  def initialize(multiplayer, last_played_at, publish_date)
    super(id = Random.rand(1..1000))
    @id = id
    @multiplayer = multiplayer
    @last_played_at = last_played_at
    @publish_date = publish_date
    @archived = can_be_archived?
  end

  private

  def can_be_archived?
    @archived = if super || Date.today - Date.parse(@last_played_at) > 365 * 2
                  true
                else
                  false
                end
  end
end
