require "set"
require "json"

class Hash
  def to_json
    JSON.generate(sort.to_h)
  end
end

class Array
  def to_json
    JSON.generate(sort)
  end
end

class String
  def to_json
    JSON.generate(self).to_sym.to_s
  end
end

class Time
  def to_json
    JSON.generate(to_s)
  end
end

class Set
  def to_json
    JSON.generate(sort)
  end
end
