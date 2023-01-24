require_relative './app'
require_relative './game'

def show_games
  if @game_list.empty?
    puts 'This list is empty at the moment'
  else
    @game_list.each_with_index do |game, index|
      puts "(#{index}) ID: #{game.id} Multiplayer: \"#{game.multiplayer}\", Last Played: #{game.last_played_at}, Published Year: #{game.publish_date} Archived: #{game.archived}" # rubocop:disable Layout/LineLength
    end
  end
end

def create_game
  print 'Multiplayer [y/n]: '
  multiplayer = gets.chomp
  print 'Last played at [yyyy/mm/dd]: '
  last_played_at = gets.chomp
  puts 'Please state when the game was published in this format - [yyyy/mm/dd]:'
  publish_date = gets.chomp
  print 'WooHoo! Game has been added succesfully'
  new_game = Game.new(multiplayer, last_played_at, publish_date)
  @game_list << new_game
end

def add_game(multiplayer, last_played_at, publish_date)
  new_game = Game.new(multiplayer, last_played_at, publish_date)
  @game_list << new_game
end
