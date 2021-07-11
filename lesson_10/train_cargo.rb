require_relative 'train'

class CargoTrain < Train
  attr_reader :type, :number
  validate :number, :format, NUMBER_FORMAT
  def initialize(number, type = :cargo)
    super
  end
end
