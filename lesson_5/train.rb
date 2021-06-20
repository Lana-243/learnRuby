require_relative 'route.rb'

class Train < Route
  attr_reader :name, :carriages
  
  def initialize(name)
    @name = name
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

  def add_carriage(train, carriage)
    add_carriage!(train, carriage) if add_carriage?(train, carriage)
  end
  
  def delete_carriage(train, carriage)
     delete_carriage!(train, carriage) if delete_carriage?(train, carriage)
  end
  
  def add_carriage?(train, carriage)
    (train.class == PassengerTrain && carriage.class == PassengerCarriage) ||(train.class == CargoTrain && carriage.class == CargoCarriage)
  end
  
  def add_carriage!(train, carriage)
    @trains[:train] << carriage if add_carriage?
  end

  def delete_carriage!(train, carriage)
     @trains[:train].delete(carriage)
  end
end


