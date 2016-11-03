class Vehicle

  def initialize
    @attributes = Hash.new()
  end

  def get_attribute(attr_name)
    return @attributes[attr_name].nil? ? ''  : @attributes[attr_name]
  end

  def set_attribute(attr_name, value)
    @attributes[attr_name] = value
  end

  # to accept a collection of attributes
  # NOT YET IMPLEMENTED
#  def set_attributes(named_values)
#  end
end