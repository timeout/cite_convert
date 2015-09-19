require 'juice/spans'
require 'juice/span'

RSpec.describe Juice::Spans do
  describe '#initialize' do
    it 'constructs a collection of spans' do
      sp = Juice::Spans.new
      expect(sp.size).to eq(0)
    end
  end

  describe '#sort!' do
    it 'sorts the collection internally' do
      sp = Juice::Spans.new
      sp << Juice::Span.new(10, 20)
      sp.sort!
      expect(sp.first).to eq(Juice::Span.new(10, 20))
    end

    it 'sorts the collection' do
      sp = Juice::Spans.new
      sp << Juice::Span.new(10, 20)
      sp << Juice::Span.new(1, 40)
      expect(sp.sort.first).to eq(Juice::Span.new(1, 40))
    end
  end

  describe '#verify?' do
    it 'verifies that a collection of spans do not overlap' do
      sp = Juice::Spans.new
      sp << Juice::Span.new(10, 12)
      sp << Juice::Span.new(14, 25)
      sp << Juice::Span.new(34, 45)
      expect(sp.verify?).to be_truthy
    end

    it 'verifies that a collection of spans do not overlap' do
      sp = Juice::Spans.new
      sp << Juice::Span.new(10, 12)
      sp << Juice::Span.new(11, 25)
      sp << Juice::Span.new(34, 45)
      expect(sp.verify?).to be_falsey
    end
  end
end
