require_relative 'route'
require_relative 'instance_counter'
require_relative 'vendor'
require_relative 'validation'

class Train
  attr_reader :number, :cars, :type, :speed
  
  include InstanceCounter
  include Validation
  
  NUMBER_FORMAT = /^[a-z\d]{3}-?[a-z\d]{2}$/i
  
  validate :number, :presence
  validate :number, :format, NUMBER_FORMAT

  @trains = []
  def initialize(number, type)
    register_instance
    @number = number
    @type = type
    validate!
    @cars = []
    @trains << self
  end

  def valid?
    validate!
    true
  rescue StandardError
    false
  end

  def self.find(number)
    @trains.find { |train| train.number == number }
  end

  def self.train_exists(number)
    number = find(number)
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

  def each_car
    cars.each { |car| yield(car) }
  end
end
