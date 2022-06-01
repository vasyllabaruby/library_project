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

  def top_reader(quantity = 1)
    readers_hash = Hash.new(false)
    @orders.each do |order|
      if readers_hash[order.reader]
        readers_hash[order.reader].add(order.book)
      else
        h = Set.new
        readers_hash[order.reader] = h.add(order.book)
      end
    end
    sort(readers_hash, quantity)
  end

  def top_book(quantity = 1)
    books_hash = Hash.new(false)
    @orders.each do |order|
      if books_hash[order.book]
        books_hash[order.book].add(order.reader)
      else
        h = Set.new
        books_hash[order.book] = h.add(order.reader)
      end
    end
    sort(books_hash, quantity)
  end

  def top_books_readers(quantity = 3)
    top_books_arr = top_book(quantity)
    total_readers = Set.new
    top_books_arr.each do |el|
      total_readers += el[1]
    end
    total_readers
  end

  private

  def sort(hash, quantity)
    hash = hash.sort_by { |_key, value| value.length }
    return hash.reverse! if quantity >= hash.length

    result = []
    quantity.times { result.push(hash.pop) }
    result
  end
end
