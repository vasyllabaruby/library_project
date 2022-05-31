# frozen_string_literal: true

class DataSaver
  def self.save(filename, data)
    File.open(filename, 'w') { |f| f.write(YAML.dump(data)) }
  end

  def self.load(filename)
    Psych.unsafe_load(File.read(filename))
  end
end
