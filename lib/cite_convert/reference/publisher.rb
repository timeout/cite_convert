module CiteConvert
  module Reference
    class Publisher
      def initialize(publisher)
        @publisher = publisher
      end

      attr_reader :publisher

      def to_s
        "#{@publisher}"
      end
    end
  end
end
