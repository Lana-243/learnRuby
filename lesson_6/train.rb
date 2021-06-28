require_relative 'route.rb'
require_relative 'instance_counter.rb'
require_relative 'company.rb'

class Train
  attr_reader :name, :cars
  include InstanceCounter
  # extend InstanceCounter::ClassMethods
  # include InstanceCounter::InstanceMethods
  @@trains = []
  def initialize(number, type)
    @number = number
    @cars = []
    @speed = 0
    @@trains << self
    register_instance
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
    @cars << car if speed.zero?
  end

  def delete_carriage(train, carriage)
     train.carriages.delete(carriage)
  end
  
end


