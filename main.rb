# require 'lib/entities/library'
require 'entities/library'

my_library = Library.new

my_library.add_author('Jim')
my_library.add_author('Oleg', 'Greeter')

author1 = my_library.authors[1]
author2 = my_library.authors[3]

my_library.add_book('Rain', author1)
my_library.add_book('Pain', author2)
my_library.add_book('The Great Gatsby', author2)

my_library.add_reader('Mykola', 'kol12@mai.com', 'Chernivtsi', 'Main', 1)
my_library.add_reader('Ivan', 'iv@mai.com', 'Kyiv', 'Kaspruka', 5)
my_library.add_reader('Andrew', 'aaBB@mai.com', 'Lviv', 'Main', 31)

book_pain = my_library.books[1]
book_great = my_library.books[2]
book_rain = my_library.books[0]

reader1_mykola = my_library.readers[0]
reader2_ivan = my_library.readers[1]
reader2_andrew = my_library.readers[2]

my_library.add_order(book_pain, reader1_mykola)
my_library.add_order(book_great, reader1_mykola)
my_library.add_order(book_great, reader2_ivan)
my_library.add_order(book_great, reader2_ivan)
my_library.add_order(book_pain, reader2_andrew)
my_library.add_order(book_pain, reader2_ivan)
my_library.add_order(book_rain, reader2_ivan)

my_library.save

top_reader = my_library.top_reader(2)
top_book = my_library.top_book(9)
reader_quantity = my_library.top_books_readers
puts 'yes'
