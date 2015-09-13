module CiteConvert
  class Person
    def initialize(surname, given_names)
      @surname, @given_names = surname, given_names
    end

    attr_reader :surname, :given_names

    def initials
      "#{first_letters.join('. ')}."
    end

    def to_s
      "#{self.given_names} #{self.surname}"
    end

    private
    def split_names
      self.given_names.split(' ')
    end

    def first_letters
      split_names.map { |name| name[0...1] }
    end

  end
end
