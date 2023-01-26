require_relative './gaming_methods'

def read_game(file)
  puts 
  puts '=====================      GAMES     ====================='
  puts 
  file.each do |el|
    game_id = el['value']['id']
    game_archived = el['value']['archived']
    game_multiplayer = el['value']['multiplayer']
    game_last_played_at = el['value']['last_played_at']
    game_publish_date = el['value']['publish_date']
    puts "ID: #{game_id}"
    puts "Multiplayer: #{game_multiplayer}"
    puts "Last Played on: #{game_last_played_at}"
    puts "Published on: #{game_publish_date}"
    puts "Archived: #{game_archived}"
    add_game(game_multiplayer, game_last_played_at, game_publish_date)
  end
end

def read_author(file)
  puts ''
  puts '=====================     AUTHORS    ====================='
  puts ''
  file.each do |el|
    author_first = el['value']['first_name']
    author_last = el['value']['last_name']
    puts "Author First Name: #{author_first} Author Last Name: #{author_last}"
  end
end
