require_relative 'vendor'

class Car
   include Vendor
   attr_reader :type
end