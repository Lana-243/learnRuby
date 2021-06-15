class Station < RailRoad
  attr_reader :trains, :station_name

  def initialize(station_name)
    @station_name = station_name
    @stations << station_name
    @trains = []
  end

  def add_train!(train)
    @trains << train
  end
  
  def add_train?(train)
   false if @trains.include? train
  end
  
  def add_train(train)
    add_train!(train) if add_train?(train)
  end

  def trains_list(station)
    @trains.map(&:train).join(', ')
  end

  def train_leaving(train)
    @trains.delete(train) if @trains.include?(train)
  end
end