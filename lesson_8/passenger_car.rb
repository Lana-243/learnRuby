require_relative 'car'

class PassengerCar < Car
  
  def initialize(seats)
    @type = :passenger
    @seats = seats
    @occupied_seats = 0
  end
  
  def occupy_seat
    @occupied_seats += 1 if free_space?
  end
  
  def free_seats
    @seats - @occupied_seats
  end
      
  def free_space?
    if free_seats <= 0
      raise StandardError, 'Car is full!'
    else
      true
    end
  end
  
  def occupied_seats_info
    puts "There are #{@occupied_seats} occupied seats in the car"
  end
  
  def free_seats_info
    puts "There are #{self.free_seats} free seats in the car"
  end
  
  protected
  attr_reader :occupied_seats
end

