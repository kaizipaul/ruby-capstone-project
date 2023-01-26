require_relative './app'
require_relative './menu'
require_relative './game_file'
require_relative './book_data'

def main
  app = App.new
  Dir.exist?('./storage') ? app.read_files : nil
  Dir.exist?('./storage') ? app.read_files2 : nil
  loop do
    menu(app)
  end
end

main
