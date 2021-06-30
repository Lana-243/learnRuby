require_relative 'route.rb'
require_relative 'instance_counter.rb'
require_relative 'vendor.rb'

class Train
  attr_reader :name, :cars, :type, :speed
  include InstanceCounter
  # extend InstanceCounter::ClassMethods
  # include InstanceCounter::InstanceMethods
  @@trains = []
  def initialize(number, type)
    @number = number
    @type = type
    register_instance
    @cars = []
    @@trains << self
  end
  
  def self.find(number)
    @@trains.find { |train| train.number == number }
  end
  
  def self.train_exists(number)
    number = self.find(number)
  end

  def add_route(route)
    @route = route
    @station_index = 0
    @route.route_stations[0].add_train(self)
  end
  
  def current_station
    @route.stations[@station_index]
  end

  def move_forward
    @route.current_station.train_leaving(self)
    @station_index += 1
    @route.current_station.add_train(self)
  end
  
  def move_backward
    @route.current_station.train_leaving(self)
    @station_index -= 1
    @route.current_station.add_train(self)
  end

  def add_car(car)
    @cars << car
  end

  def delete_car(car)
     train.cars.delete(car)
  end
  
end


