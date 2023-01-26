require_relative './book_methods'

def read_book(file)
  puts 
  puts '=====================      BOOKS     ====================='
  puts 
  file.each do |elem|
    book_id = elem['value']['id']
    book_publisher = elem['value']['publisher']
    book_cover = elem['value']['cover_state']
    puts "ID: #{book_id}"
    puts "Publisher: #{book_publisher}"
    puts "Cover State: #{book_cover}"
    add_book(book_publisher, book_cover)
  end
end

def read_label(file)
  puts 
  puts '=====================     LABELS     ====================='
  puts 
  file.each do |el|
    label_title = el['value']['title']
    puts "Label: #{label_title}"
  end
end
