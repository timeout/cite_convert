require 'juice/span'

RSpec.describe Juice::Span do
  describe '#initialize' do
    it 'constructs a span' do
      Juice::Span.new(10, 24)
    end
  end

  describe '#<=>' do
    it 'compares two spans' do
      first = Juice::Span.new(10, 24)
      second = Juice::Span.new(13, 56)

      expect(first <=> second).to be(-1)
      expect(second <=> first).to be(1)
    end
  end
end
