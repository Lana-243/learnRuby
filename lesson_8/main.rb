require_relative 'station'
require_relative 'instance_counter'
require_relative 'route'
require_relative 'train'
require_relative 'cargo_car'
require_relative 'passenger_car'
require_relative 'train_cargo'
require_relative 'train_passenger'
require_relative 'car'

class RailRoad
  attr_reader :stations, :trains, :routes, :cars

  def initialize
    @trains = []
    @routes = []
    @stations = []
  end
  
  def menu
    loop do
      puts 'Press 1 if you want to create a train, a route or a station'
      puts 'Press 2 if you want to apply changes to a train, a route or a station'
      puts 'Press 3 if you want to view info'
      puts 'Press any other key to exit the program'
      answer = gets.chomp
      case answer
        when '1'
          create
        when '2'      
          change
        when '3'
          view
        else
          puts 'End of program'
          break
      end
    end
  end  
  
  def no_station_at_route(route, station)
    station.name =! route.route_stations.find{ |st| st.name == st}
  end
  
  def find_train(number)
    @trains.find { |train| train.number == number }
  end

  def find_route(name)
    @routes.find { |rt| rt.route == name }
  end

  def find_station(name)
    @stations.find { |station| station.name == name }
  end
  
  def create
    puts 'Press 1 if you want to create a train'
    puts 'Press 2 if you want to create a route'
    puts 'Press 3 if you want to create a station'
    puts 'Press any other key to exit the program'
    creation_answer = gets.chomp
    case creation_answer
      when '1'
        create_train
      when '2'
        create_route
      when '3'
        create_station
    end
  end
  
  def create_train
    puts 'What is the train type?'
    puts 'Press 1 if it is Passenger train'
    puts 'Press 2 if it is Cargo train'
    puts 'Press any other key to exit the program'
    train_type_anser = gets.chomp
    if train_type_anser == '1'
      create_passenger
    elsif train_type_anser == '2'
      create_cargo
    end
  end
  
  def create_cargo
    puts 'Enter train number'
    number = gets.chomp
    if find_train(number).nil?
      @trains << CargoTrain.new(number)
      train_create_info(number)
    else
      train_exists_info(number)
    end
  end
  
  def create_passenger
    puts 'Enter train number'
    number = gets.chomp
    if find_train(number).nil?
      @trains << PassengerTrain.new(number)
      train_create_info(number)
    else
      train_exists_info(number)
    end
  rescue Exception => e
      puts e.message
  end
  
  def train_create_info(number)
    puts "Train #{number} has been created!"
  end
  
  def train_exists_info(number)
    puts "Train #{number} already exists!"
  end
  
  def route_create_info(route)
    puts "Route #{route} has been created!"
  end
  
  def route_creation_error
    puts 'Route was not created. Please check the data'
  end
  
  def station_create_info(name)
    puts "Station #{name} has been created!"
  end
  
  def station_exists_info(name)
    puts "Station #{name} already exists!"
  end
  
  def create_route
    puts 'Enter route name'
    route = gets.chomp 
    puts 'Enter first station'
    first_station = gets.chomp
    puts 'Enter last station'
    last_station = gets.chomp
    if route_validate(route, first_station, last_station)
      new_route(route, first_station, last_station)
      route_create_info(route)
    else
      route_creation_error
    end
  rescue Exception => e
      puts e.message
  end
  
  def route_validate(route, first_station, last_station)
    find_route(route).nil? && (find_station(first_station) != nil) && (find_station(last_station) != nil)
  end
  
  def new_route(route, first_station, last_station)
    @routes << Route.new(route, first_station, last_station)
  end

  def create_station
    puts 'Enter station name'
    name = gets.chomp 
    if find_station(name).nil?
      new_station(name)
      station_create_info(name)
    else
      station_exists_info(name)
    end
  rescue Exception => e
      puts e.message
  end
  
  def new_station(name)
    @stations << Station.new(name)
  end
  
  def change
    puts 'Press 1 if you want to change a train'
    puts 'Press 2 if you want to change a route'
    puts 'Press any other key to exit the program'   
    change_answer = gets.chomp
    case change_answer  
      when '1'
        train_change
      when '2'
        route_change
    end
  end
  
  def train_change
    puts 'Press 1 if you want to assign a route to a train'
    puts 'Press 2 if you want to add cars to the train'
    puts 'Press 3 if you want to delete cars from the train'
    puts 'Press 4 if you want to move train forward'
    puts 'Press 5 if you want to move train backward'
    puts 'Press any other key to exit the program' 
    train_change_answer = gets.chomp
    case train_change_answer  
    when '1'
      assign_route
    when '2'
      add_cars
    when '3'
      delete_cars
    when '4'
      move_forward
    when '5'
      move_backwards
    end
  end
  
  def assign_route
    puts 'Enter train name'
    train = gets.chomp
    puts 'Enter route name'
    route = gets.chomp
    if (find_train(train).nil? == false) && (find_route(route).nil? == false)
      find_train(train).add_route(route)
      puts 'Route has been assigned'
    else
      puts 'Route has not been assigned'
    end
  end
  
  def add_cars
    puts 'Enter train name'
    train_name = gets.chomp
    puts 'Enter car name'
    car = gets.chomp
    train = find_train(train_name)
    if train.nil? == false
      car = (train.instance_of? PassengerTrain ? PassengerCar.new : CargoCar.new)
      train.add_car(car)
    else
      'Car has not been added. Please check the data'
    end
  end
  
  def delete_cars
    puts 'Enter train name'
    train_name = gets.chomp
    train = find_train(train_name)
    if (train.nil? == false) && (train.cars.null? == false)
      train.delete_car(train.cars[-1]) 
    else
      'Car has not been deleted. Please check the data'
    end
  end
  
  def move_forward
    puts 'Enter train name'
    train_name = gets.chomp
    train = find_train(train_name)
    if train.nil? == false
      train.move_forward
      puts "Train #{train_name} has been moved forward"
    else
      puts 'There is no such train'
    end
  end
  
  def move_backwards
    puts 'Enter train name'
    train_name = gets.chomp
    train = find_train(train_name)
    if train.nil? == false
      train.move_backward
      puts "Train #{train_name} has been moved backwards"
    else
      puts 'There is no such train'
    end
  end
  
  def route_change
    puts 'Press 1 if you want to add station to the route'
    puts 'Press 2 if you want to delete station from the route'
    puts 'Press any other key to exit the program' 
    answer = gets.chomp
    case answer
      when '1'
        change_add_station
      when '2'
        change_delete_station
    end
  end
  
  def change_route_add_station
    puts 'Enter route name'
    route_name = gets.chomp
    route = find_route(route_name)
    puts 'Enter station name'
    station_name = gets.chomp
    station = find_station(station_name)
    if (route.nil? == false) && (station.nil? == false) && no_station_at_route(route, station)
      route.add_station(station)
    else
      'Station has not been added. Please check the data'
    end
  end
  
  def change_delete_station
    puts 'Enter route name'
    route_name = gets.chomp
    route = find_route(route_name)
    puts 'Enter station name'
    station_name = gets.chomp
    station = find_station(station_name)
    if (route.nil? == false) && (station.nil? == false) && (no_station_at_route(route, station) == false) && (route.stations.count >= 2)
      route.delete_station(station)
    else
      puts 'Please check the data!'
    end
  end
  
  def view
    puts 'Press 1 if you want to view station list'
    puts 'Press 2 if you want to view train list at a station'
    puts 'Press any other key to exit the program' 
    view_answer = gets.chomp
    case view_answer
      when '1'
        view_station_list
      when '2'
        puts 'Enter station name'
        station_name = gets.chomp
        station = find_station(station_name)
        if station.nil?
          puts 'There is no station with this name'
        else
          puts view_train_list(station)
        end
    end
  end  
  
  def view_station_list
    puts @stations.map(&:name).join(', ')
  end

  def view_train_list(station)
    puts station.trains.map(&:name).join(', ')
  end
end

rr = RailRoad.new
rr.menu
