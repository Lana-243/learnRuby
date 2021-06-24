
module InstanceCounter
  
  module ClassMethods
    class << self
      attr_accessor :instances
    end
  end
  protected
  module InstanceMethods
    def register_instance
      self.class.instances ||= 0 
      self.class.instances += 1
    end
  end
end