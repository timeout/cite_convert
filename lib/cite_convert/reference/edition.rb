module CiteConvert
  module Reference
    class Edition
      def initialize(edition)
        @edition = edition.to_i
      end

      attr_reader :edition

      def to_s
        "#{@edition}"
      end
    end
  end
end
