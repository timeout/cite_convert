require 'juice/span'

module Juice
  class Spans
    include Enumerable
    def initialize
      @spans = Array.new
    end

    def size
      @spans.size
    end

    def add_span(span)
      @spans << span
    end

    alias_method :<<, :add_span

    def [](index)
      raise IndexError.new unless index < self.size and index >= 0
      @spans[index]
    end

    def first
      @spans.first
    end

    def last
      @spans.last
    end

    def sort
      result = Spans.new
      @spans.sort.each { |span| result << span }
      result
    end

    def sort!
      @spans.sort!
    end

    def each(&block)
      @spans.each(&block)
    end

    def verify?
      self.sort.each_cons(2) do |pair|
        return false if pair.first.finish >= pair.last.start
      end
      true
    end

    def to_array
      result = Array.new
      self.each {|span| result << span.start; result << span.finish; }
      result
    end

    def to_s
      "[ #{@spans.map { |span| span.to_s }.join(', ')} ]"
    end
  end
end
