class Station

  attr_reader :trains, :name

  def initialize(name)
    @name = name
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

  private
#shows actions inside the methods
  def add_train!(train)
    @trains << train
  end
  
  def add_train?(train)
   false if @trains.include? train
  end
end



