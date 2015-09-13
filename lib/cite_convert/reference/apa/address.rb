require 'cite_convert/reference/address'
require 'cite_convert/reference/apa/us_states'

module CiteConvert
  module Reference
    module Apa
      class Address < Address
        def initialize(city, state = nil)
          super(city, state)
        end

        def to_s
          if self.state? and US_STATES.keys.include? (self.state.to_sym)
            "#{city}, #{US_STATES[self.state.to_sym]}"
          else
            super.to_s
          end
        end
      end
    end
  end
end
