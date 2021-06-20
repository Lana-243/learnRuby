require_relative 'train.rb'

class PassengerTrain < Train
  attr_reader :name
  def initialize(name)
    @name = name
    @type = 'Passenger'
    @carriages = []
  end
end
