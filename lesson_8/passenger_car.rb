require_relative 'car'

class PassengerCar < Car
  
  attr_reader :occupied_seats
  
  def initialize(seats)
    @number = rand(100)
    @type = :passenger
    @seats = seats
    @occupied_seats = 0
  end
  
  def occupy_seat
    @occupied_seats += 1 if free_space?
  end
  
  def available_seats
    @seats - @occupied_seats
  end
      
  def free_space?
    if available_seats <= 0
      raise StandardError, 'Car is full!'
    else
      true
    end
  end
  
  def occupied_seats_info
    puts "There are #{@occupied_seats} occupied seats in the car"
  end
  
  def available_seats_info
    puts "There are #{self.available_seats} free seats in the car"
  end
end

