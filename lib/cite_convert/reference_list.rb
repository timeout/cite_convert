module CiteConvert
  module ReferenceList
    class ReferenceList
      include Enumerable
      def initialize
        @list = Array.new
      end

      def size
        @list.size
      end

      def empty?
        @list.empty?
      end

      def each(&block)
        @list.each(&block)
      end

      def sort!
        @list.sort!
      end

      def [](index)
        raise IndexError.new("Bad Index: #{}") if (index < 1) or (index > self.list.size)
        @list[index]
      end

      def add_reference(reference)
        @list << reference
      end

    end
  end
end
