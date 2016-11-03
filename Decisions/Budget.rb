require_relative './DecisionRequirement'

class Budget < DecisionRequirement
  def self.is_match(custValue, vehicleValue)
    vehicleValue <= custValue
  end
end