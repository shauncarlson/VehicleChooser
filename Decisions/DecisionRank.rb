require_relative './DecisionPoint'

class DecisionRank < DecisionPoint

  def self.match(preference, value, vehicles)
    return nil if vehicles.nil?
    raise ArgumentError if !vehicles.respond_to? 'each'
    vehicles.each do |vehicle, rank|
      vehicles[vehicle] = rank + get_rank(preference, value, vehicle)
    end
    vehicles
  end

  def self.get_rank(preference, value, vehicle)
    vehicle.get_attribute(preference).nil? ? 0 : value * vehicle.get_attribute(preference)
  end
end