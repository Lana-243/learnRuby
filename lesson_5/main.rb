require_relative 'route.rb'
require_relative 'station.rb'
require_relative 'train.rb'

class RailRoad
    @stations = []
    @trains = {}
    @routes = []
    @wagons = []
    
end


loop do
  puts 'Press 1 is you want to create a train, a route or a station'
  puts 'Press 2 is you want to apply changes to a train, a route or a station'
  puts 'Press 3 is you want to view info'
  puts 'Press any other key to exit the program'
  answer = gets.chomp
    
  case answer
    
    when '1'
      puts 'Press 1 is you want to create a train'
      puts 'Press 2 is you want to create a route'
      puts 'Press 3 is you want to create a station'
      puts 'Press any other key to exit the program'
      creation_answer = gets.chomp
      create
    when '2'      
      puts 'Press 1 is you want to change a train'
      puts 'Press 2 is you want to change a route'
      puts 'Press 3 is you want to change a station'
      puts 'Press any other key to exit the program'   
      change_answer = gets.chomp
      change
    when '3'
      puts 'Press 1 is you want to view station list'
      puts 'Press 2 is you want to view train list at a station'
      puts 'Press any other key to exit the program' 
      view_answer = gets.chomp
      view
    else 
        break   
    end
end

def create
case creation_answer
  when '1'
    puts 'What is the train type?'
    puts 'Press 1 if it is Passenger train'
    puts 'Press 2 if it is Cargo train'
    puts 'Press any other key to exit the program'
    train_type_anser = gets.chomp
    if train_type_anser = '1'
       puts 'Enter train name'
      train_name = gets.chomp
      train_name = PassengerTrain.new(train_name)
    elsif '2'
      puts 'Enter train name'
      train_name = gets.chomp
      train_name = CargoTrain.new(train_name)          
    else
      break
    end
    
  when '2'
    puts 'Enter route name'
      name = gets.chomp 
      if @routes.include? name
        puts 'There is already route with this name'
        exit
      end
      puts 'Enter first station'
      first_station = gets.chomp
      if @stations.include? first_station
        puts 'There is no station with this name'
        exit
      end
      puts 'Enter last station'
      last_station = gets.chomp
      if @stations.include? last_station
        puts 'There is no station with this name'
        exit
      end
      name = Route.new(name, first_station, last_station)
    break
    when '3'
      
  else
    break
    
end

def change
  
case change_answer  
  when '1'
    train_change
  when '2'
    route_change
  when '3'
    station_change
  else
    break
end

end

def train_change
  puts 'Press 1 is you want to assign a route to a train'
  puts 'Press 2 is you want to add wagons to the train'
  puts 'Press 3 is you want to delete wagons from the train'
  puts 'Press 4 is you want to move train forward'
  puts 'Press 5 is you want to move train backward'
  puts 'Press any other key to exit the program' 
  train_change_answer = gets.chomp
  
  case train_change_answer  
    when '1'
      puts 'Enter train name'
      train_name = gets.chomp
      puts 'Enter route name'
    when '2'
      puts 'Enter train name'
      train_name = gets.chomp
    when '3'
      puts 'Enter train name'
      train_name = gets.chomp
    when '4'
      puts 'Enter train name'
      train_name = gets.chomp
    when '6'
      puts 'Enter train name'
      train_name = gets.chomp
    else
      break
  end
end

def route_change
  puts 'Press 1 is you want to create a route'
  puts 'Press 2 is you want to add station to the route'
  puts 'Press 3 is you want to delete station from the route'
  puts 'Press any other key to exit the program' 
  route_change_answer = gets.chomp
  
  case route_change_answer
    when '1'
      
    when '2'
    
    when '3'
    
  else
    break
  end
  
  
end

def station_change
  
end

def view
  
end