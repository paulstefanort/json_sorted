require "json"

class Hash
  def to_json
    JSON.generate(sort.to_h)
  end
end
