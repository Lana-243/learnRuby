require_relative 'car'

class CargoCar < Car
  
  def initialize(volume)
    @number = rand(100)
    @type = :cargo
    @volume = volume
    @occupied_volume = 0
  end 
  
  def fill_car(volume)
    @occupied_volume += volume if volume_available?(volume)
  end
  
  def available_volume
    @volume - @occupied_volume
  end
  
  def volume_available?(volume)
    if volume > available_volume
      raise StandardError, 'Car is full!'
    else
      true
    end
  end
  
  def occupied_volume_info
    puts "Volume occupied is #{@occupied_volume} out of #{@volume}"
  end
  
  def available_volume_info
    puts "Volume available is #{self.available_volume} out of #{@volume}"
  end
end
