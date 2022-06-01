require 'rdoc'

module DataSaver
  DEFAULT_FILENAME = 'Library.data'

  def save(filename = DEFAULT_FILENAME, data)
    File.open(filename, 'w') { |f| f.write(YAML.dump(data)) }
  end

  def load(filename = DEFAULT_FILENAME)
    Psych.unsafe_load(File.read(filename))
  end
end
