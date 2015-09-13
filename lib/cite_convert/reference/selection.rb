module CiteConvert
  module Reference
    class Selection
      def initialize(selection_title)
        @selection = selection_title
      end

      attr_reader :selection

      def to_s
        "#{self.selection}"
      end
    end
  end
end
