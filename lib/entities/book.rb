# frozen_string_literal: true

require 'services/validation_service'

class Book
  include ValidationService
  attr_accessor :title, :author

  def initialize(title, author)
    @title = title
    @author = author
    validate
  end

  def validate
    validate_presence(@title)
    validate_class(@title, String)
    not_empty(@title)
    validate_presence(@author)
    validate_class(@author, Author)
  end
end
