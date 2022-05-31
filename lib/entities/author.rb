# frozen_string_literal: true

require 'services/validation_service'

class Author
  attr_reader :name, :biography

  def initialize(name, biography = '')
    @name = name
    @biography = biography
    unless check
      raise Errno # передати name
    end
  end

  def check
    return true if ValidationService.not_blank(@name)

    false
  end

  # def to_s
  #   "Author: #{name} with biography: #{biography}"
  # end

  # def to_json
  #   {'name'=>@name, 'biography'=>@biography}
  # end
  # def self.from_json(string)
  #   data = JSON.load(string)
  #   self.new data['name'], data['biography']
  # end
end
