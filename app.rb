require_relative './gaming_methods'

class App
  attr_accessor :game_list, :author_list

  # Constructor for App methods
  def initialize()
    @game_list = []
    @author_list = []
  end
# *****************************

  def game_display
    show_games
  end

  def game_create
    create_game
  end

  def author_display
    show_authors
  end
end