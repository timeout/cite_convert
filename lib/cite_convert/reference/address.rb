module CiteConvert
  module Reference
    class Address
      def initialize(city, state = nil)
        @city, @state = city, state
      end

      attr_reader :city, :state

      def state?
        not self.state.nil?
      end

      def to_s
        if self.state?
          "#{self.city}, #{self.state}" 
        else
          "#{self.city}"
        end
      end
    end
  end
end
