require 'optionparser'

module ValidationService
  def validate_positive(variable)
    return if variable.positive?

    raise ::OptionParser::InvalidArgument, 'InvalidArgument error, variable should be positive'
  end

  def validate_class(variable, class_name)
    return if variable.is_a?(class_name)

    raise ::OptionParser::InvalidArgument, "InvalidArgument error, field should be #{class_name} type"
  end

  def validate_presence(variable)
    raise ::OptionParser::InvalidArgument, 'InvalidArgument error, field should not be empty' if variable.nil?
  end

  def not_empty(str)
    raise ::OptionParser::InvalidArgument, 'InvalidArgument error, empty variable' if str.strip.empty?
  end
end
