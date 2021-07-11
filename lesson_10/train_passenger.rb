require_relative 'train'

class PassengerTrain < Train
  attr_accessor :number, :type
  validate :number, :format, NUMBER_FORMAT

  def initialize(number, type = :passenger)
    super
  end
end
