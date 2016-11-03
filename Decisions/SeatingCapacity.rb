require_relative './DecisionPoint'

class SeatingCapacity < DecisionRequirement
  def self.is_match(custValue, vehicleValue)
    vehicleValue >= custValue
  end
end