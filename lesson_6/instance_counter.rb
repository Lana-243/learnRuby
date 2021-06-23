module InstanceCounter
  
  attr_reader :instances
  
  @@instances = 0
  def instances
    @@instances += 1 
  end
  
  private
  def register_instance
    self.instances
  end
end