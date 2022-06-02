require 'entities/library'

my_library = Library.new

author_jim = Author.new('Jim')
author_oleg = Author.new('Oleg', 'Greeter')
my_library.add_author(author_jim)
my_library.add_author(author_oleg)

book_rain = Book.new('Rain', author_jim)
book_pain = Book.new('Pain', author_oleg)
book_gatsby = Book.new('The Great Gatsby', author_oleg)
my_library.add_book(book_rain)
my_library.add_book(book_pain)
my_library.add_book(book_gatsby)
# my_library.add_book(nil, author2)

reader_mykola = Reader.new('Mykola', 'kol12@mai.com', 'Chernivtsi', 'Main', 1)
reader_ivan = Reader.new('Ivan', 'iv@mai.com', 'Kyiv', 'Kaspruka', 5)
reader_andrew = Reader.new('Andrew', 'aaBB@mai.com', 'Lviv', 'Main', 31)
my_library.add_reader(reader_mykola)
my_library.add_reader(reader_ivan)
my_library.add_reader(reader_andrew)

order_p_m = Order.new(book_pain, reader_mykola)
order_g_m = Order.new(book_gatsby, reader_mykola)
order_r_m = Order.new(book_rain, reader_mykola)
order_g_i = Order.new(book_gatsby, reader_ivan)
order_p_a = Order.new(book_pain, reader_andrew)
order_p_i = Order.new(book_pain, reader_ivan)
order_r_a = Order.new(book_rain, reader_andrew)


my_library.add_order(order_p_m)
my_library.add_order(order_g_m)
my_library.add_order(order_r_m)
my_library.add_order(order_g_i)
my_library.add_order(order_p_a)
my_library.add_order(order_p_i)
my_library.add_order(order_r_a)

my_library.save_lib

top_reader = my_library.top_reader(2)
puts 'Top reader (2)'
puts top_reader
puts '-------------'
top_book = my_library.top_book(9)
puts 'Top book (all)'
puts top_book
puts '-------------'
reader_count = my_library.top_books_readers_count
puts "Top book reader count (default) #{reader_count}"
puts '-------------'
