require_relative './book'
require_relative './app'

def book_list
  if @book_list.empty?
    puts 'Your Books list is empty'
  else
    @book_list.each_with_index do |book, index|
      puts "(#{index}) ID: #{book.id}",
           "Publisher: #{book.publisher}",
           "Cover State: #{book.cover_state}"
    end
  end
end

def create_book
  print 'What\'s the state of the Book Cover? [good/bad]: '
  cover_state = gets.chomp.downcase
  print 'Insert Book Publisher? '
  publisher = gets.chomp
  new_book = Book.new(publisher, cover_state)
  @book_list.push(new_book)
  puts "\n The book has been created successfully!✅ "
end

def add_book(publisher, cover_state)
  new_book = Book.new(publisher, cover_state)
  @book_list << new_book
end

def list_authors
  if @author_list.empty?
    puts 'Author list is empty'
  else
    @author_list.each_with_index do |author, index|
      puts "(#{index}) ID: #{author.id}"
      puts "Author First Name: #{author.first_name}"
      puts "Author Last Name: \"#{author.last_name}"
    end
  end
end