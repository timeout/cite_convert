module Juice
  class Span
    include Comparable
    def initialize(start, finish)
      @start, @finish = start, finish
    end

    attr_reader :start, :finish

    def <=>(other)
      self.start <=> other.start
    end

    def to_s
      "(#{self.start}, #{self.finish})"
    end
  end
end
