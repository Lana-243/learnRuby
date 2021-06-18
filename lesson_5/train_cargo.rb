class CargoTrain < Train
  def initialize(name)
    @name = name
    @type = 'Cargo'
    @wagons = []
  end
end