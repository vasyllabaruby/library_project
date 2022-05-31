# frozen_string_literal: true

require 'entities/author'
require 'entities/book'
require 'entities/order'
require 'entities/reader'
require 'services/data_saver'
require 'yaml'
require 'date'

class Library
  attr_reader :books, :authors, :readers, :orders
  FILE = 'Library.data'

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
    DataSaver.save(FILE, self)
  end

  def self.load
    DataSaver.load(FILE)
  end

  def top_reader(quantity = 1)
    readers_hash = Hash.new(0)
    @orders.each do |order|
      readers_hash[order.reader] += 1
    end
    sort(readers_hash, quantity)
  end

  def top_book(quantity = 1)
    books_hash = Hash.new(0)
    @orders.each do |order|
      books_hash[order.book] += 1
    end
    sort(books_hash, quantity)
  end

  def top_books_reader(quantity = 3)
    0
  end

  def sort(hash, quantity)
    hash = hash.sort_by { |key, value| value }
    return hash.reverse! if quantity >= hash.length

    result = []
    quantity.times { result.push(hash.pop) }
    result
  end
end

