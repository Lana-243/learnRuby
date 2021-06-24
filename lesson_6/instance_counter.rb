
module InstanceCounter
  
  module ClassMethods
    class << self
      attr_reader :instances
      @instances = 0
    end
  end
  protected
  module InstanceMethods
    def register_instance
      self.class.instances += 1
    end
  end
end