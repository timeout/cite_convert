require 'date'

module CiteConvert
  module Reference
    class PublicationDate
      def initialize(year, month = nil, day = nil)
        self.year, self.month, self.day = year.to_i, month, day
      end

      attr_accessor :year
      attr_reader :month, :day

      def month= (month)
        @month = month ? month.to_i : month
      end

      def day= (day)
        @day = day ? day.to_i : day
      end

      def month?
        not self.month.nil?
      end

      def day?
        not self.day.nil?
      end

      def to_date
        Date.new(@year, @month || 1, @day || 1)
      end

      def to_s
        if day? and month?
          "#{self.year}.#{self.month}.#{self.day}" 
        elsif month?
          "#{self.year}.#{self.month}"
        else
          "#{self.year}"
        end
      end
    end
  end
end
