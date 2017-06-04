############################################################
#
#  Name:         Dennis Sauve
#  Date:         06-04-17
#  Assignment:   Books Class
#  Class:        CIS283
#  Description:  Menu Driven book managing application
#
############################################################

require_relative('menu.rb')
require_relative('sauve_book.rb')

menu = Menu.new(
    'View all Books',
    'Add book',
    'Update book',
    'Delete book',
    'View book with most pages',
    'View book with least pages',
    'View books with pages greater than or equal to 1000',
    'View books with pages less than 1000',
    'View books with pages between 500-1000 inclusive',
    'Exit'
)
menu.title=('Book Menu')

# Read a file of books into your memory structure.
fin = File.open('books_file.txt')
book_data = fin.readlines
fin.close

# Create a new book object for each line in the file and add that book to an Array in your main program.
library = []
book_data.each do |line|
  book = line.strip.split("\t")
  library << Book.new(book[0], book[1], book[2].to_i)
end

# Create book
def create_book
  title, author, pages = '', '', ''
  while title.strip.empty?
    print "\nPlease enter the new book title: "
    title = gets.chomp
  end
  while author.strip.empty?
    print "\nPlease enter the new book author: "
    author = gets.chomp
  end
  until pages.to_i.to_s == pages
    print "\nPlease enter the new book length: "
    pages = gets.chomp
  end
  return Book.new(title, author, pages.to_i)
end

# Add book
def add_book(library)
  library << create_book
  puts "\nNew book successfully added to the library.", ''
end

# Update book
def update_book(library)
  update_index = ''
  library.each_with_index do |book, index|
    puts (index + 1).to_s.ljust(3) + book.to_s
  end
  print "\nWhich book do you want to update: "
  until (1..library.length).to_a.include?(update_index.to_i)
    update_index = gets.chomp
  end
  library.insert(update_index.to_i - 1, create_book)
  library.delete_at(update_index.to_i)
  puts "\nBook successfully updated to the library.", ''
end

# Delete book
def delete_book(library)
  delete_index = ''
  library.each_with_index do |book, index|
    puts (index + 1).to_s.ljust(3) + book.to_s
  end
  print "\nWhich book do you want to delete: "
  until (1..library.length).to_a.include?(delete_index.to_i)
    delete_index = gets.chomp
  end
  library.delete_at(delete_index.to_i - 1)
end

# View book with most pages
def get_longest_book(library)
  longest_book = library[0]
  library.each do | book |
    longest_book = book if book.pages > longest_book.pages
  end
  return longest_book
end

# View book with least pages
def get_shortest_book(library)
  shortest_book = library[0]
  library.each do | book |
    shortest_book = book if book.pages < shortest_book.pages
  end
  return shortest_book
end

# View books with pages greater than or equal to 1000
def get_greater_1000(library)
  books = []
  library.each do | book |
    books << book if book.pages >= 1000
  end
  return books
end

# View books with pages less than 1000
def get_lesser_1000(library)
  books = []
  library.each do | book |
    books << book if book.pages < 1000
  end
  return books
end

# View books with pages between 500-1000 inclusive
def get_books_500_1000(library)
  books = []
  library.each do | book |
    books << book if 500 <= book.pages && book.pages <= 1000
  end
  return books
end

# Menu
choice = 0
until choice == menu.quit
  choice = menu.get_menu_choice
  case choice
    when 1
      puts '', library, ''
    when 2
      add_book(library)
    when 3
      update_book(library)
    when 4
      delete_book(library)
    when 5
      puts '', get_longest_book(library), ''
    when 6
      puts '', get_shortest_book(library), ''
    when 7
      book_array = get_greater_1000(library)
      puts '', book_array == [] ? 'No books greater than 1000 pages' : book_array, ''
    when 8
      book_array = get_lesser_1000(library)
      puts '', book_array == [] ? 'No books lesser than 1000 pages' : book_array, ''
    when 9
      book_array = get_books_500_1000(library)
      puts '', book_array == [] ? 'No books lesser than 1000 pages' : book_array, ''
    else
      nil
  end
end

# TODO: write books out
