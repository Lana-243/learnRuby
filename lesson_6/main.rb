require_relative 'instance_counter.rb'
require_relative 'route.rb'
require_relative 'station.rb'
require_relative 'train.rb'
require_relative 'cargo_carriage.rb'
require_relative 'passenger_carriage.rb'
require_relative 'train_cargo.rb'
require_relative 'train_passenger.rb'

class RailRoad
  attr_reader :stations, :trains, :routes, :carriages

  def initialize
    @trains = []
    @routes = []
    @carriages = []
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
          break
      end
    end
  end  
  
  def no_train(train)
    train =! @trains.find{ |tr| tr.name == train}
  end
  
  def no_station(station)
    station =! @stations.find{ |st| st.name == station}
  end
  
  def no_route(route)
    route =! @routes.find{ |rt| rt.name == route}
  end
  
  def no_carriages(car)
    car =! @carriages.find{ |car| car.name == car}
  end
  
  def no_station_at_route(route, station)
    station =! route.route_stations.find{ |st| st.name == st}
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
    puts 'Enter train name'
    train = gets.chomp
    if no_train(train)
      @trains << CargoTrain.new(train)
    else
      'Train was not created'
    end
  end
  
  def create_passenger
    puts 'Enter train name'
    train = gets.chomp
    if no_train(train)
      @trains << PassengerTrain.new(train)
    else
      'Train was not created'
    end
  end
  
  def create_route
    puts 'Enter route name'
    route = gets.chomp 
    puts 'Enter first station'
    first_station = gets.chomp
    puts 'Enter last station'
    last_station = gets.chomp
    
    if no_route(route) && no_station(first_station) && no_station(last_station)
      new_route(route, first_station, last_station)
    else
      'Route was not created. Please check the data'
    end
  end
  
  def new_route(name, first_station, last_station)
    @routes << Route.new(name, first_station, last_station)
  end

  def create_station
    puts 'Enter station name'
    name = gets.chomp 
    if no_station(name)
      name = Station.new(name) 
    else
      'Station was not created. Please check the data'
    end
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
    puts 'Press 2 if you want to add carriages to the train'
    puts 'Press 3 if you want to delete carriages from the train'
    puts 'Press 4 if you want to move train forward'
    puts 'Press 5 if you want to move train backward'
    puts 'Press any other key to exit the program' 
    train_change_answer = gets.chomp
    case train_change_answer  
    when '1'
      assign_route
    when '2'
      add_carriages
    when '3'
      delete_carriages
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
    if no_train(train) && no_route(route)
      train.add_route(route)
    else
      'Route has not been assigned'
    end
  end
  
  def add_carriages
    puts 'Enter train name'
    train = gets.chomp
    puts 'Enter carriage name'
    carriage = gets.chomp
    puts 'Press 1 if it is Cargo carriage'
    puts 'Press 2 if it is Passenger carriage'
    type = gets.chomp
    if no_train(train) && no_carriages(carriage) && (type = '1' || type = '2')
      create_carriage(type)
      add_carriage(train, carriage)
    else
      'Carriage has not been added. Please check the data'
    end
  end
  
  def delete_carriages
    puts 'Enter train name'
    train = gets.chomp
    puts 'Enter carriage name'
    carriage = gets.chomp
    if carriage_exists(train, carriage)
      delete_carriage(train, carriage) 
    else
      'Carriage has not been deleted. Please check the data'
    end
  end
  
  def carriage_exists(train, carriage)
    carriage =! train.carriages.find{ |car| car.name == carriage}
  end
  
  def create_carriage(type)
    if type == '1'
      @carriages << CargoCarriage.new
    elsif type == '2'
      @carriages << PassengerCarriage.new
    end
  end
  
  def move_forward
    puts 'Enter train name'
    train = gets.chomp
    if no_train(train) == false
      train.move_forward
    else
    'There is no such train'
    end
  end
  
  def move_backwards
    puts 'Enter train name'
    train = gets.chomp
    if no_train(train) == false
      train.move_backward
    else
      'There is no such train'
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
    route = gets.chomp
    puts 'Enter station name'
    station = gets.chomp
    if (no_route(route) == false) && (no_station(station) == false) && no_station_at_route(route, station)
      route.add_station(station_add)
    else
      'Station has not been added. Please check the data'
    end
  end
  
  def change_delete_station
    puts 'Enter route name'
    route = gets.chomp
    puts 'Enter station name'
    station = gets.chomp
    if (no_route(route) == false) && (no_station(station) == false) && (no_station_at_route(route, station) == false)
      route.delete_station(station)
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
        station = gets.chomp
        if no_station(station)
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
