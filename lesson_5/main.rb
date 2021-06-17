require_relative 'route.rb'
require_relative 'station.rb'
require_relative 'train.rb'
require_relative 'cargo_carriage.rb'
require_relative 'passenger_carriage.rb'
require_relative 'train_cargo.rb'
require_relative 'train_passenger.rb'

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
  end
  break   
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
     puts 'Enter train name'
    train_name = gets.chomp
    train_name = PassengerTrain.new(train_name)
  elsif train_type_anser == '2'
    puts 'Enter train name'
    train_name = gets.chomp
    train_name = CargoTrain.new(train_name)          
  end
end
 
def create_route
  puts 'Enter route name'
  name = gets.chomp 
    if @routes.include? name
      puts 'There is already route with this name'
    end
    puts 'Enter first station'
    first_station = gets.chomp
    if @stations.include? first_station
      puts 'There is no station with this name'
    end
    puts 'Enter last station'
    last_station = gets.chomp
    if @stations.include? last_station
      puts 'There is no station with this name'
    end
    name = Route.new(name, first_station, last_station)
end

def create_station
  puts 'Enter station name'
  name = gets.chomp 
    if @stations.include? name
      puts 'There is already station with this name'
    end
  name = Station.new(name)  
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
    puts 'Enter train name'
    train = gets.chomp
    puts 'Enter route name'
    route = gets.chomp
    train.add_route(route)
  when '2'
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
  when '3'
    puts 'Enter train name'
    train = gets.chomp
    puts 'Enter carriage name'
    carriage = gets.chomp
    delete_carriage(train, carriage)
  when '4'
    puts 'Enter train name'
    train_name = gets.chomp
    train_name.move_forward
  when '5'
    puts 'Enter train name'
    train_name = gets.chomp
    train_name.move_backward
  end
end

def route_change
  puts 'Press 1 if you want to add station to the route'
  puts 'Press 2 if you want to delete station from the route'
  puts 'Press any other key to exit the program' 
  answer = gets.chomp
  case answer
    when '1'
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
    when '2'
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
  puts 'Press any other key to exit the program' 
  view_answer = gets.chomp
  case view_answer
    when '1'
      @stations.map(&:station_name).join(', ')
    when '2'
      puts 'Enter station name'
      station = gets.chomp
      if @stations.include? station
        puts 'There is no station with this name'
      end
      station.trains.map(&:train).join(', ')
  end
end