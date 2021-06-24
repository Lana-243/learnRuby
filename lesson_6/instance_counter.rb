
module InstanceCounter
  
  module ClassMethods
      attr_accessor :instances
  end
  
  private
  module InstanceMethods
    def register_instance
      self.class.instances ||= 0 
      self.class.instances += 1
    end
  end
end