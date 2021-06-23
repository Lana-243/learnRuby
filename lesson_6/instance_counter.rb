module InstanceCounter
  
  attr_reader :instances
  
  @@instances = 0
  def instances
    self.instances
  end
  
  private
  def register_instance
    @@instances += 1 
  end
end