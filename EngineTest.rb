require './DecisionEngine'
require './Vehicle'
require './Decisions/DecisionPoint'
require './CustomerProfile'

def print_recommendations(recommendations)
  if recommendations.length < 1
    puts "You look like a bicycle type of fellow!"
  else
    puts "You should test drive the #{recommendations[0].get_attribute('name')}!"
    if recommendations.length > 1
      others = ''
      last = recommendations.length - 1
      secondToLast = last - 1
      for i in 1..last do
        others += "the #{recommendations[i].get_attribute('name')}"
        if i < last
          if last > 2
            others += i == secondToLast ? ', or ' : ', '
          elsif i == secondToLast
            others += ' or '
          end
        end
      end
      puts "You may also like the #{others}"
    end
  end
end

class EngineTest

  vehicles = [{'name'=>'Accord', 'brand'=>'Honda', 'price'=>23000,
               'passengers'=>5, 'economy'=>2, 'performance'=>2, 'body'=>'4-door'},
              {'name'=>'Prius', 'brand'=>'Toyota', 'price'=>25000,
               'passengers'=>5, 'economy'=>3, 'performance'=>2, 'body'=>'4-door'},
              {'name'=>'458', 'brand'=>'Ferrari', 'price'=>263500,
               'passengers'=>2, 'economy'=>1, 'performance'=>3, 'body'=>'2-door'},
              {'name'=>'Spark', 'brand'=>'Chevy', 'price'=>13000,
               'passengers'=>4, 'economy'=>2, 'performance'=>1, 'body'=>'4-door'}]

  engine = DecisionEngine.new()
  vehicles.each do |curVehicle|
    vehicle = Vehicle.new()
      curVehicle.each do |attribute, value|
        vehicle.set_attribute(attribute, value)
      end
    engine.add_vehicle(vehicle)
  end
  #puts vehicles

  customer = CustomerProfile.new()
  customer.set_preference('economy', 1)
  customer.set_preference('performance', 3)
  customer.set_preference('cost', 2)
  #customer.set_preference('price', 20000)
  customer.set_preference('passengers', 4)
  recommendations = engine.recommend_vehicle(customer)
  print_recommendations(recommendations)

end