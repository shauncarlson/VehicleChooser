require_relative './DecisionPoint'

class DecisionRequirement < DecisionPoint
  def self.match(preference, value, vehicles)
    return vehicles if vehicles.nil?
    raise ArgumentError if !vehicles.respond_to? 'each'
    vehicles.each do |vehicle, rank|
      vehicles.delete(vehicle) if !is_match(value, vehicle.get_attribute(preference))
    end
    vehicles
  end

  def self.is_match(custValue, vehicleValue)
    true
  end
end