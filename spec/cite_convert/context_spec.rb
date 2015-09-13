require 'cite_convert/context'

RSpec.describe CiteConvert::Context do
  describe '#initialize' do
    it 'constructs a context' do
      ctxt = CiteConvert::Context.new('The tacit assumption that intelligence is at the heart of success has been called into question.')
    end
  end
end
