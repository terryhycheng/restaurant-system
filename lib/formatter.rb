class Formatter
  def format(object)
    return "- #{object.name}: $#{object.price}"
  end
end