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