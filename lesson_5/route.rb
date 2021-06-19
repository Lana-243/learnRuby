class Route

  attr_reader :route, :first_station, :last_station

  def initialize(route, first_station, last_station)
    @route = route
    @route_stations = [first_station, last_station]
  end
  
  def add_station(middle_station)
    @route.insert(-2, middle_station)
  end

  def delete_station(station)
    @stations.delete(station) if @stations.include? station
  end
end