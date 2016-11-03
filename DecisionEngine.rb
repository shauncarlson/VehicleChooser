require 'require_all'
require_all './Decisions'

class DecisionEngine

  # registered Vehicles
  def initialize
    @vehicles = Array.new

    # decision rules are based on key words that may be provided by CustomerProfile
    @decisions = {'price'=> Budget, 'passengers'=> SeatingCapacity, 'body'=> Style,
                 'brand'=> Manufacturer, 'economy'=> DecisionRank,
                 'performance'=> DecisionRank, 'cost'=> PricePoint}
  end

  def add_vehicle(vehicle)
    # make sure vehicle name is provided, else cannot really recommend the vehicle
    raise ArgumentError if !vehicle.respond_to? "get_attribute"
    raise ArgumentError if name = vehicle.get_attribute("name").nil?
    @vehicles.push(vehicle) if vehicle.is_a? Vehicle
  end

  def recommend_vehicle(profile)
    raise ArgumentError if !profile.respond_to? 'get_preferences'
    matches = Hash.new()

    @vehicles.each do |vehicle|
      matches[vehicle] = 0
    end

    # iterate through customer's preferences
    preferences = profile.get_preferences
    preferences.each do |preference, value|
      matches = @decisions[preference].match(preference, value, matches)
      break if matches.length < 2
    end

    matches = matches.sort {|x,y| x[1] <=> y[1]}
    recommendations = Array.new()
    matches.reverse_each do |match, rank|
      recommendations.push(match)
    end

    return recommendations


    # cycle through deal-breaker rules to eliminate no-gos
    @decisions[0].each do |key, value|
      if !profile.get_preference(key).nil?
        matches = value.match(profile, matches)
        return nil if matches.length == 0
        custProfile.delete(key)
      end
    end

    # use remaining customer profile
    custProfile.each do |preference, value|
      next if @decisions[preference].nil?
      matches = @decisions[preference].match(profile, matches)
      return nil if matches.length == 0
    end
    matches
  end
end