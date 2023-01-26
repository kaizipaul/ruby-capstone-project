require_relative './app'
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

def list_music
  if @music_list.empty?
    puts 'Music list is empty'
  else
    @music_list.each_with_index do |music, index|
      puts
      puts "(#{index})"
      puts "ID: #{music.id}"
      puts "On Spotify: #{music.on_spotify}"
      puts "Publish Date: #{music.publish_date}"
      puts "Archived: #{music.archived}"
    end
  end
end

def create_music
  puts 'Is it on spotify? [y/n]: '
  on_spotify = gets.chomp
  puts 'Please state when was the music published [dd/mm/yyyy]:'
  publish_date = gets.chomp
  print 'Music Album Added Succesfully'
  new_music = MusicAlbum.new(on_spotify, publish_date)
  @music_list.push(new_music)
end

def add_music(on_spotify, publish_date)
  new_music = MusicAlbum.new(on_spotify, publish_date)
  @music_list << new_music
end
