module CiteConvert
  module Reference
    class Volume
      def initialize(volume)
        @volume = volume.to_i
      end

      attr_reader :volume

      def to_s
        "#{@volume}"
      end
    end
  end
end
