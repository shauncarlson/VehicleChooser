require_relative './DecisionPoint'

class FuelEconomy < DecisionPoint
  def self.match(value, vehicles)
    return nil if vehicles.nil?
    raise ArgumentError if !vehicles.respond_to? 'each'
    matches = new Array
    vehicles.each do |vehicle|
      matches.push(vehicle) if is_match(profile, vehicle)
    end
    matches
  end
end