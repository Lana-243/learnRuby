require_relative 'train'

class PassengerTrain < Train
  attr_accessor :number, :type

  def initialize(number, type = :passenger)
    super
  end
end
