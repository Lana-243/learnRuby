class PassengerTrain < Train
  def initialize(name)
    @name = name
    @type = 'Passenger'
    @wagons = []
  end
end
