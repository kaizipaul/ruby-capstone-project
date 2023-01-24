require_relative './musicalbum'
require_relative './gaming_methods'
require 'json'

class App
  attr_accessor :album_list, :genre_list, :game_list, :author_list

  def initialize()
    @music_list = []
    @genre_list = []
    @game_list = []
    @author_list = []
  end

  def music_display
    list_album
  end

  def genre_display
    list_genres
  end

  def music_create
    create_album
  end
  
  def game_display
    show_games
  end

  def game_create
    create_game
  end

  def author_display
    show_authors
  end

  def save_files
    instance_variables.each do |var|
      file_name = var.to_s.chomp('_list').delete('@')
      ary = []
      instance_variable_get(var).each do |obj|
        hash = { ref: obj, value: to_hash(obj) }
        ary << hash
      end
      File.write("./storage/#{file_name}.json", JSON.generate(ary))
    end
  end

  def read_files
    instance_variables.each do |var|
      file_name = var.to_s.chomp('_list').delete('@')
      if File.exist?("./storage/#{file_name}.json") && File.read("./storage/#{file_name}.json") != ''
        ary = JSON.parse(File.read("./storage/#{file_name}.json"))
        case file_name
        when 'music'
          read_music(ary)
        end
      else
        File.write("./storage/#{file_name}.json", '[]')
      end
    end
  end

  def read_files2
    instance_variables.each do |var|
      file_name = var.to_s.chomp('_list').delete('@')
      if File.exist?("./storage/#{file_name}.json") && File.read("./storage/#{file_name}.json") != ''
        ary = JSON.parse(File.read("./storage/#{file_name}.json"))
        case file_name
        when 'genre'
          read_genre(ary)
        end
      else
        File.write("./storage/#{file_name}.json", '[]')
      end
    end
  end

  def read_music(file)
    puts
    puts 'MUSIC ALBUMS'
    puts
    file.each do |el|
      music_id = el['value']['id']
      music_archived = el['value']['archived']
      music_on_spotify = el['value']['on_spotify']
      music_publish_date = el['value']['publish_date']
      puts "ID: #{music_id} On Spotify: #{music_on_spotify} Published on: #{music_publish_date}  Archived: #{music_archived}" # rubocop:disable Layout/LineLength
      add_music(music_on_spotify, music_publish_date)
    end
  end

  def read_genre(file)
    puts
    puts 'GENRES'
    puts
    file.each do |el|
      genre_name = el['value']['name']
      puts "Genre Name: #{genre_name}"
    end
  end

  private

  def to_hash(obj)
    hash = {}
    obj.instance_variables.each do |var|
      hash[var.to_s.delete('@')] = obj.instance_variable_get(var)
    end
    hash
  end
end