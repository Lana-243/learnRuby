require_relative 'train_passenger.rb'
require_relative 'instance_counter.rb'
class Station

  attr_reader :trains, :name
  @@stations = []
  extend InstanceCounter::ClassMethods
  include InstanceCounter::InstanceMethods
  
  def initialize(name)
    @name = name
    @trains = []
    @@stations << name
    self.register_instance
  end
  
  def add_train(train)
    add_train!(train) if add_train?(train)
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

  private
#shows actions inside the methods
  def add_train!(train)
    @trains << train
  end
  
  def add_train?(train)
   false if @trains.include? train
  end
end