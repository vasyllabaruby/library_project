# frozen_string_literal: true

class ValidationService
  def self.not_blank(*str)
    str.each do |el|
      return false if !el.is_a?(String) || el.strip.empty?
    end
    true
  end
end
