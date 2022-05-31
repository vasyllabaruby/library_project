
class DataSaver
  def self.save(filename, data)
    File.open(filename, 'w') { |f| f.write(YAML.dump(data)) }
  end

  def self.load(filename)
    result = Psych.unsafe_load(File.read(filename))
  end
end
