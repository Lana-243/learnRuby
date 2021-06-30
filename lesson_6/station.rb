require_relative 'train_passenger.rb'
require_relative 'instance_counter.rb'
class Station

  attr_reader :trains, :name
  include InstanceCounter
  # extend InstanceCounter::ClassMethods
  # include InstanceCounter::InstanceMethods
  
  @@all_stations = []
  
  def initialize(name)
    @name = name
    @trains = []
    @@all_stations << self
    register_instance
  end
  
  def add_train(train)
    @trains << train
  end
  
  def train_leaving(train)
    @trains.delete(train) if @trains.include?(train)
  end
  
  def trains_list
    @trains.map(&:train).join(', ')
  end
  
  def all
    @@stations.map(&:name).join(', ')
  end
end