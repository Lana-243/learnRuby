require_relative 'train_passenger'
require_relative 'instance_counter'
require_relative 'validation'

class Station
  attr_reader :trains, :name

  include InstanceCounter
  include Validation
  
  NAME_FORMAT = /\w.+/i
  
  validate :name, :presence
  validate :name, :format, NAME_FORMAT

  @@all_stations = []
  
  def self.all
    @@all_stations ||= []
  end

  def initialize(name)
    @name = name
    @trains = []
    validate!
    is_unique?
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

  def each_train
    @trains.each { |train| yield(train) }
  end

  def is_unique?
    raise 'This station already exists!' if self.class.all.find { |s| s.name == name }
    true
  end
end
