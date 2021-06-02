class Station
  def initialize(station_name)
    @station_name = station_name
    @passenger_trains = []
    @cargo_trains = []
  end

  def add_train_to_station(name)
    case name.type
    when 'Cargo'
      @cargo_trains << name
    when 'Passenger'
      @passenger_trains << name
    end
  end

  def all_trains
    @all_trains = @passenger_trains + @cargo_trains
  end

  def trains_list_full
    @all_trains.each { |name| puts name}
  end

  def trains_list_by_type
    puts "Passanger trains: #{@passenger_trains.map(&:name).join(‘, ’)}; Cargo trains: #{@cargo_trains.map(&:name).join(‘, ’)}"
  end

  def train_leaving(train_leaving_name)
    if (@passenger_trains + @cargo_trains).include? train_leaving_name
      @passenger_trains.delete_if { |passenger| passenger.include? train_leaving_name }
      @cargo_trains.delete_if { |cargo| cargo.include? train_leaving_name }
    end  
 end

class Route
  attr_reader :route

  def initialize(route, first_station, last_station)
    @route_name = route
    @route_stations = [first_station, last_station]
  end

  def add_station(middle_station)
    @route_stations.insert(-2, middle_station)
  end

  def trains_list_full
    @route_stations.each { |station| puts station}
  end

  def del_station(station_to_del)
      @route_stations.delete(station_to_del) if @route_stations.include? station_to_del
  end

class Train
  attr_reader :type, :speed, :carriages_number
  def initialize(name, type, carriages_number)
    @name = name
    @train_type_list = {}
    @train_type_list[name] = type
    @carriages_number = carriages_number
    @speed = 0
  end

  def train_speed_add(speed)
    @speed += speed if speed > 0
  end

  def train_stop
    @speed = 0
  end

  def carriages_number_change(change_car)
    if @speed.zero? && (carriages_number + change_car) > 0
      @carriages_number += change_car
    end
  end

  def route_add(route)
    @route = route
    @station_index = 0
    @route.route_stations[@station_index].@add_train_to_station(self)
  end  

  def route_add(route)
    @route = route
    @station_index = 0
    @route.route_stations[@station_index].@add_train_to_station(self)
  end  

  def move_fwd
    @route.curr_station.train_leaving(self)
    @station_index += 1
    @route.curr_station.add_train_to_station(self)
  end

  def move_bckwd
    @route.curr_station.train_leaving(self)
    @station_index -= 1
    @route.curr_station.add_train_to_station(self)
  end

  def curr_station
    @route.route_stations[@station_index]
  end

  def next_station
    @route.route_stations[@station_index+1]
  end

   def prev_station
    @route.route_stations[@station_index-1] if station_index > 0
   end
end
