require_relative 'route.rb'
require_relative 'station.rb'
require_relative 'cargo_carriage.rb'
require_relative 'passenger_carriage.rb'
require_relative 'train_cargo.rb'
require_relative 'train_passenger.rb'

class RailRoad
  attr_reader :stations, :trains, :routes, :carriages
  
  def initialize
    @stations = []
    @trains = []
    @routes = []
    @carriages = []
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
      train = CargoTrain.new(train)
      @trains << train.name
    end
  end
  
  def create_passenger
    puts 'Enter train name'
    train = gets.chomp
    if no_train(train)   
      train = PassengerTrain.new(train)
      @trains << train.name
    end
  end
  
  def no_train(train)
    @trains.include? train == false
  end
  
  def create_route
    puts 'Enter route name'
    name = gets.chomp 
    if routes.include? name
      puts 'There is already route with this name'
    end
    puts 'Enter first station'
    first_station = gets.chomp
    if stations.include? first_station
      puts 'There is no station with this name'
    end
    puts 'Enter last station'
    last_station = gets.chomp
    if stations.include? last_station
      puts 'There is no station with this name'
    end
    name = Route.new(name, first_station, last_station)
    puts 'Route has been created'
  end
  
  def create_station
    puts 'Enter station name'
    name = gets.chomp 
    name = Station.new(name)
    @stations << name 
  end
  
  def change
    puts 'Press 1 if you want to change a train'
    puts 'Press 2 if you want to change a route'
    puts 'Press 3 if you want to change a station'
    puts 'Press any other key to exit the program'   
    change_answer = gets.chomp
    case change_answer  
      when '1'
        train_change
      when '2'
        route_change
      when '3'
        station_change
    end
  end
  
  def assign_route
    puts 'Enter train name'
    train = gets.chomp
    puts 'Enter route name'
    route = gets.chomp
    train.add_route(route)
  end
  
  def add_carriages
    puts 'Enter train name'
    train = gets.chomp
    puts 'Enter carriage name'
    carriage = gets.chomp
    puts 'Press 1 if it is Cargo carriage'
    puts 'Press 2 if it is Passenger carriage'
    type = gets.chomp
    if type == '1'
      carriage = CargoCarriage.new
    elsif type == '2'
      carriage = PassengerCarriage.new
    end
    add_carriage(train, carriage)
  end
  
  def delete_carriages
    puts 'Enter train name'
    train = gets.chomp
    puts 'Enter carriage name'
    carriage = gets.chomp
    delete_carriage(train, carriage)
  end
  
  def move_forward
    puts 'Enter train name'
    train_name = gets.chomp
    train_name.move_forward
  end
  
  def move_backwards
    puts 'Enter train name'
    train_name = gets.chomp
    train_name.move_backward
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
  
  def change_add_station
    puts 'Enter route name'
    route = gets.chomp
    if @routes.include? route
      puts 'There is no route with this name'
    end
    puts 'Enter station name'
    station = gets.chomp
    if @stations.include? station
      puts 'There is no station with this name'
    end
    if route.route_stations.include? station
      puts 'There is aleady such station at this route'
    end
    additional_station.add_station(station_add)
  end
  
  def change_delete_station
    puts 'Enter route name'
    route = gets.chomp
    if @routes.include? route
      puts 'There is no route with this name'
    end
    puts 'Enter station name'
    station = gets.chomp
    if @stations.include? station
      puts 'There is no station with this name'
    end
    if route.route_stations.include? station
      route.delete_station(station)
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
  
  def station_change
    puts 'Press 1 if you want to add a train to the station'
    puts 'Press 2 if yoi want to delete the train from the station'
    puts 'Press any other key to exit the program' 
    action = gets.chomp
    case action
    when '1'
      puts 'Enter train name'
      train = gets.chomp
      puts 'Enter station name'
      station = gets.chomp
      station.add_train(train)
    when '2'
      puts 'Enter train name'
      train = gets.chomp
      puts 'Enter station name'
      station = gets.chomp
      station.train_leaving(train)
    end
  end
  
  def view
    puts 'Press 1 if you want to view station list'
    puts 'Press 2 if you want to view train list at a station'
    puts 'Press 3 if you want to view train list at the railroad'
    puts 'Press any other key to exit the program' 
    view_answer = gets.chomp
    case view_answer
      when '1'
        @stations.map(&:name).join(', ') 
      when '2'
        puts 'Enter station name'
        station = gets.chomp
        if @stations.include? station
          puts 'There is no station with this name'
        end
        puts station.trains_list
      when '3'
       puts @trains.map(&:name).join(', ')
    end
  end  
  
  def view_station_list(station)
    puts station.map(&:name).join(', ')
  end

  def view_train_list(station)
    puts station.map(&:name).join(', ')
  end
end

rr = RailRoad.new

rr.menu
