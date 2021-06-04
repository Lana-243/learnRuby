class Station
  attr_reader :trains, :station_name

  def initialize(station_name)
    @station_name = station_name
    @trains = []
  end

  def add_train(train)
    @trains << train
  end

  def trains_list
    @trains.map(&:name).join(', ')
  end

  def trains_list_by_type
    passenger_trains = @trains.select { |train| train.type == 'Passenger' }.map(&:name).join(', ')
    cargo_trains = @trains.select { |train| train.type == 'Cargo' }.map(&:name).join(', ')
    puts "Passenger trains: #{passenger_trains}; Cargo trains: #{cargo_trains}"
  end

  def train_leaving(train)
    @trains.delete(train) if @trains.include?(train)
  end
end

class Route
  attr_reader :route, :first_station

  def initialize(route, first_station, last_station)
    @route = route
    @route_stations = [first_station, last_station]
  end

  def add_station(middle_station)
    @route.insert(-2, middle_station)
  end

  def trains_list_full
    @stations.map(&:station_name).join(‘, ’)
  end

  def delete_station(station)
    @stations.delete(station) if @stations.include? station
  end
end

class Train
  attr_reader :name, :type, :speed, :carriages_number

  def initialize(name, type, carriages_number)
    @name = name
    @type = type
    @carriages_number = carriages_number
    @speed = 0
  end

  def add_speed(speed)
    @speed += speed if speed > 0
  end

  def train_stop
    @speed = 0
  end

  def carriages_number_change(change_car)
    @carriages_number += change_car if @speed.zero? && (carriages_number + change_car).positive?
  end

  def add_route(route)
    @route = route
    @station_index = 0
    @route.stations[0].add_train(self)
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

  def next_station
    @route.stations[@station_index + 1]
  end

  def previous_station
    @route.stations[@station_index - 1] if station_index > 0
  end
end
