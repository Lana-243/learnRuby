require_relative 'route.rb'
require_relative 'instance_counter.rb'
require_relative 'vendor.rb'

class Train
  attr_reader :name, :cars, :type, :speed
  include InstanceCounter

  NUMBER_FORMAT = /^[a-z\d]{3}-?[a-z\d]{2}$/i
  
  @@trains = []
  def initialize(number, type)
    register_instance
    @number = number
    @type = type
    validate!
    @cars = []
    @@trains << self
  end
  
  def valid?
    validate!
    true
  rescue
    false
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
  
  def each_car(&block)
    carriages.each { |car| yield(car) }
  end
  
  private
  
  def validate
    raise StandardError, 'Please enter train number' if number == nil
    raise StandardError, 'Format is incorrect. Please try again: 3 letters/numbers, optional hyphen and 2 letters/numbers' if number !~ NUMBER_FORMAT
  end
  
end


