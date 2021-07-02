require_relative 'train_passenger.rb'
require_relative 'instance_counter.rb'
class Station

  attr_reader :trains, :name
  include InstanceCounter

  @@all_stations = []
  
  def initialize(name)
    @name = name
    @trains = []
    validate!
    @@all_stations << self
    register_instance
  end
  
  def valid?
    validate!
    true
  rescue
    false
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
  
  def self.all
    @@all_stations.map(&:name).join(', ')
  end
  
  def each_train(&block)
    @trains.each { |train| yield(train) }
  end
  
  def validate!
    errors = []
    
    errors << 'Please enter station name' if name == nil 
    errors << 'Station name should have more than 3 characters' if name.length < 3  
    
    raise StandardError, errors.join(". ") if !errors.empty?
  end
end