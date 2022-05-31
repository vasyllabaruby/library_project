# frozen_string_literal: true

require 'services/validation_service'

class Book
  attr_accessor :title, :author

  def initialize(title, author)
    @title = title
    @author = author
    unless check
      raise Errno # передати name
    end
  end

  def check
    return true if ValidationService.not_blank(@title) && !author.nil? && author.is_a?(Author)

    false
  end
end
