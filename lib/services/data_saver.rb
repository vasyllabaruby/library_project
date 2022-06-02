require 'rdoc'

module DataSaver
  DEFAULT_FILENAME = 'Library.data'.freeze

  def save(data, filename = DEFAULT_FILENAME)
    File.open(filename, 'w') { |f| f.write(YAML.dump(data)) }
  end

  def load(filename = DEFAULT_FILENAME)
    Psych.unsafe_load(File.read(filename))
  end
end
