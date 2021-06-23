module InstanceCounter
  
  attr_reader :instances
  class << self
  
  @instances = 0
  def self.instances
    @instances
  end
  
  private
  def register_instance
    self.class.instances += 1 
  end
end