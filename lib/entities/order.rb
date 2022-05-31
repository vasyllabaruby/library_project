require 'date'
require 'services/validation_service'

class Order
  attr_accessor :book, :reader, :date

  def initialize(book, reader, date = DateTime.now)
    @book = book
    @reader = reader
    @date = date
    unless check
      raise Errno # передати name
    end
  end

  def check
    return true if @book.is_a?(Book) && @reader.is_a?(Reader) && @date.is_a?(Date)

    false
  end
end
