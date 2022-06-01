# frozen_string_literal: true

require 'date'
require 'services/validation_service'

class Order
  include ValidationService
  attr_accessor :book, :reader, :date

  def initialize(book, reader, date = DateTime.now)
    @book = book
    @reader = reader
    @date = date
    check
  end

  def check
    return true if validate_presence(@book) && validate_class(@book, Book) &&
                   validate_class(@reader, Reader) &&
                   validate_class(@date, Date)

    false
  end
end
