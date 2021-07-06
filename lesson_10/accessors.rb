module Accessors
  def self.included(base)
    base.extend ClassMethods
  end
  
  module ClassMethods
    def attr_accessor_with_history(*names)
      names.each do |name|
        var_name = "@#{name}".to_sym
        define_method(name) { instance_variable_get(var_name) }

        define_method("#{name}=".to_sym) do |value|
          instance_variable_set(var_name, value)
          @name_list ||= {}
          @name_list[var_name] ||= []
          @name_list[var_name] << value
        end

        define_method("#{name}_history") { @name_list[var_name] }
      end
    end

    def strong_attr_accessor(name, arg_class)
      var_name = "@#{name}".to_sym
      define_method(name) { instance_variable_get(var_name) }

      define_method("#{name}=".to_sym) do |value|
        raise(StandartError, 'Incorrect class') unless value.is_a?(arg_class)
        instance_variable_set(var_name, value)
      end
    end
  end
  
 end