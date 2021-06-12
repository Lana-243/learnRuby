class Train < RailRoad
  attr_reader :name, :type, :speed

  def add_speed(speed)
    @speed += speed if speed > 0
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

class PassengerTrain < Train
  def initialize(name)
    @name = name
    @speed = 0
    @trains[:passenger] << name
  end
end

class CargoTrain < Train
  def initialize(name)
    @name = name
    @speed = 0
    @trains[:cargo] << name
  end
end
