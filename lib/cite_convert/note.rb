module CiteConvert
  module Note
    class Note
      def initialize(primary, secondary = nil, support = nil)
        @primary, @secondary, @support = primary, secondary, support
      end

      attr_reader :primary, :secondary, :support

      def to_s
        throw NotImplementedError.new('#to_s not implemented')
      end
    end
  end
end
