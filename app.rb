require_relative './musicalbum'
require 'json'

class App
  attr_accessor :album_list, :genre_list

  def initialize()
    @album_list = []
    @label_list = []
    @genre_list = []
  end

  def album_display
    list_album
  end

  def genre_display
    list_genres
  end

  def album_create
    create_album
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

  private

  def to_hash(obj)
    hash = {}
    obj.instance_variables.each do |var|
      hash[var.to_s.delete('@')] = obj.instance_variable_get(var)
    end
    hash
  end
end