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
    validate_string(@name)
    validate_string(@email)
    validate_string(@city)
    validate_string(@street)
    validate_presence(@house)
    validate_class(@house, Integer)
    validate_positive(@house)
  end

  def validate_string(field)
    validate_presence(field)
    validate_class(field, String)
    not_empty(field)
  end
end
