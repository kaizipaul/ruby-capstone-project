require_relative './src/app'
require_relative './src/menu'
require_relative './src/game_file'
require_relative './src/book_data'

def main
  app = App.new
  Dir.exist?('./storage') ? app.read_files : nil
  Dir.exist?('./storage') ? app.read_files2 : nil
  loop do
    menu(app)
  end
end

main
