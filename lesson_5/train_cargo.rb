require_relative 'train.rb'

class CargoTrain < Train
  attr_reader :name
  def initialize(name)
    @name = name
    @type = 'Cargo'
    @carriages = []
  end
end