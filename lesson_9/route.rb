require_relative 'instance_counter'
class Route
  attr_reader :route, :first_station, :last_station, :route_stations

  include InstanceCounter
  # extend InstanceCounter::ClassMethods
  # include InstanceCounter::InstanceMethods

  @@routes = []

  def initialize(route, first_station, last_station)
    @route = route
    @route_stations = [first_station, last_station]
    validate!
    @@routes << self
  end

  def valid?
    validate!
    true
  rescue StandardError
    false
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

  private

  def validate!
    errors = []

    errors << 'Please enter route name' if route.nil?
    errors << 'Please enter first station name' if first_station.nil?
    errors << 'Please enter last station name' if last_station.nil?
    if (first_station.length < 3) || (last_station.length < 3)
      errors << 'Station name should have more than 3 characters'
    end

    raise StandardError, errors.join('. ') unless errors.empty?
  end
end
