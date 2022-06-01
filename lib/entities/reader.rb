# frozen_string_literal: true

require 'services/validation_service'

class Reader
  include ValidationService
  attr_accessor :name, :email, :city, :street, :house

  def initialize(name, email, city, street, house)
    @name = name
    @email = email
    @city = city
    @street = street
    @house = house
    validate
  end

  def validate
    return true if validate_presence(@name) && validate_class(@name, String) && not_empty(@name) &&
                   validate_presence(@email) && validate_class(@email, String) && not_empty(@email) &&
                   validate_presence(@city) && validate_class(@city, String) && not_empty(@city) &&
                   validate_presence(@street) && validate_class(@street, String) && not_empty(@street) &&
                   validate_presence(@street) && validate_class(@house, Integer) && validate_positive(@house)

    false
  end
end
