module CiteConvert
  class Persons
    include Enumerable

    def initialize
      @persons = Array.new
    end

    attr_reader :persons

    def add(person)
      @persons << person
    end

    alias_method :<<, :add

    def size
      @persons.size
    end

    def empty?
      @persons.empty?
    end

    def first
      @persons.first
    end

    def each(&block)
      @persons.each(&block)
    end

    def to_s
      raise NotImplementedError.new("Abstract class")
    end

    private
    def person_names
      @persons.map { |person| person.to_s }
    end
  end
end
