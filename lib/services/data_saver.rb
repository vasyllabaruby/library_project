# frozen_string_literal: true

require 'rdoc'

class DataSaver

  DEFAULT_FILENAME = 'Library.data'

  def self.save(filename = DEFAULT_FILENAME, data)
    File.open(filename, 'w') { |f| f.write(YAML.dump(data)) }
  end

  def self.load(filename = DEFAULT_FILENAME)
    begin
      Psych.unsafe_load(File.read(filename))
    rescue RDoc::Store::MissingFileError => e
      e.message
      e.backtrace.inspect
    end
  end
end
