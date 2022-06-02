require 'entities/author'
require 'entities/book'
require 'entities/order'
require 'entities/reader'
require 'services/data_saver'
require 'yaml'
require 'date'
require 'set'
require 'entities/library'

class Library
  include DataSaver
  attr_reader :books, :authors, :readers, :orders

  DEFAULT_QUANTITY = 1
  TOP_READERS_DEFAULT_QUANTITY = 3

  def initialize
    @books = []
    @authors = []
    @readers = []
    @orders = []
    load_lib
  end

  def add_author(author)
    @authors.push(author)
  end

  def add_order(order)
    @orders.push(order)
  end

  def add_book(book)
    @books.push(book)
  end

  def add_reader(reader)
    @readers.push(reader)
  end

  def save_lib
    save(self)
  end

  def load_lib
    loaded_entities = load
    if loaded_entities.is_a?(Library)
      @books = loaded_entities.books
      @authors = loaded_entities.authors
      @readers = loaded_entities.readers
      @orders = loaded_entities.orders
    end
  end

  def top_reader(quantity = DEFAULT_QUANTITY)
    readers_hash = @orders.group_by(&:reader)
    readers_result = sort(readers_hash, quantity).transpose
    readers_result[0]
  end

  def top_book(quantity = DEFAULT_QUANTITY)
    books_hash = @orders.group_by(&:book)
    books_result = sort(books_hash, quantity).transpose
    books_result[0]
  end

  def top_books_readers_count(quantity = TOP_READERS_DEFAULT_QUANTITY)
    books_hash = @orders.group_by(&:book)
    orders_arr = sort(books_hash, quantity).transpose[1].flatten
    total_readers = Set.new
    orders_arr.each do |el|
      total_readers.add(el.reader)
    end
    total_readers.length
  end

  private

  def sort(hash, quantity)
    hash = hash.sort_by { |_key, value| value.length }
    hash.reverse!
    return hash if quantity >= hash.length

    hash.first(quantity)
  end
end
