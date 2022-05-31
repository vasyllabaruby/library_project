require 'services/validation_service'

class Reader
  attr_accessor :name, :email, :city, :street, :house

  def initialize(name, email, city, street, house)
    @name = name
    @email = email
    @city = city
    @street = street
    @house = house
    unless check
      raise Errno # передати name
    end
  end

  def check
    return true if ValidationService.not_blank(@name, @email, @city, @street) && @house.is_a?(Integer) && @house > 0

    false
  end
end
