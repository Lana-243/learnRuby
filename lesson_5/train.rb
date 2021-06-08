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