require_relative 'train.rb'

class CargoTrain < Train
  attr_reader :name, :carriages
  def initialize(name)
    @name = name
    @carriages = []
  end
end