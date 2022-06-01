# frozen_string_literal: true

require 'services/validation_service'

class Author
  include ValidationService
  attr_reader :name, :biography

  def initialize(name, biography = '')
    @name = name
    @biography = biography
    validate
  end

  def validate
    return true if validate_presence(@name) && validate_class(@name, String) && not_empty(@name)

    false
  end
end
