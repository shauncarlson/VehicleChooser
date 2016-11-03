require_relative './DecisionPoint'

class PricePoint < DecisionPoint
  def self.match(preference, value, vehicles)
    return ArgumentError if !vehicles.respond_to? "each"
    ordered = Hash.new()
    vehicles.each do |vehicle, rank|
      ordered[vehicle] = vehicle.get_attribute('price').nil? ? 10000000 : vehicle.get_attribute('price')
    end
    ordered = ordered.sort_by{|k, v| v}.reverse
    matches = Hash.new()
    position = 1
    ordered.each do |vehicle, price|
      matches[vehicle] = vehicles[vehicle] + value * position
      position += 1
    end
    matches
  end
end