require_relative 'instance_counter'
require_relative 'validation'
require_relative 'station'

class Route
  attr_reader :route, :first_station, :last_station, :route_stations

  include InstanceCounter
  include Validation
  # extend InstanceCounter::ClassMethods
  # include InstanceCounter::InstanceMethods

  @@routes = []
  
  validate :first_station, :presence
  validate :last_station, :presence
  
  def initialize(route, first_station, last_station)
    @route = route
    @route_stations = [first_station, last_station]
    validate!
    @@routes << self
  end

  def self.find(route)
    @@routes.find { |rt| rt.route == route }
  end

  def self.route_exists(route)
    route = find(route)
  end

  def add_station(middle_station)
    @route.insert(-2, middle_station)
  end

  def delete_station(station)
    @stations.delete(station) if @stations.include? station
  end

end
