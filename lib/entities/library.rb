# frozen_string_literal: true

require 'entities/author'
require 'entities/book'
require 'entities/order'
require 'entities/reader'
require 'services/data_saver'
require 'yaml'
require 'date'
require 'set'

class Library
  attr_reader :books, :authors, :readers, :orders

  def initialize
    entity = Library.load
    @books = entity.books
    @authors = entity.authors
    @readers = entity.readers
    @orders = entity.orders
  end

  def add_author(name, biography = '')
    new_author = Author.new(name, biography)
    @authors.push(new_author)
  end

  def add_order(book, reader, date = DateTime.now)
    new_order = Order.new(book, reader, date)
    @orders.push(new_order)
  end

  def add_book(title, author)
    new_book = Book.new(title, author)
    @books.push new_book
  end

  def add_reader(name, email, city, street, house)
    new_reader = Reader.new(name, email, city, street, house)
    @readers.push(new_reader)
  end

  def save
    DataSaver.save(self)
  end

  def self.load
    DataSaver.load
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

  def sort(hash, quantity)
    hash = hash.sort_by { |_key, value| value.length }
    return hash.reverse! if quantity >= hash.length

    result = []
    quantity.times { result.push(hash.pop) }
    result
  end
end
