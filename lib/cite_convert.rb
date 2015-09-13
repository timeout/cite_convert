require 'jpts_extractor'
require 'cite_convert/reference_list/apa'
require 'cite_convert/reference_factory/bridge'
require 'cite_convert/reference_factory/apa'

module CiteConvert
  def self.deserialize(io)
    JPTSExtractor.extract(io)
  end

  def self.make_reference_list(article)
    apa_reference_list = CiteConvert::ReferenceList::Apa.new

    article.back.ref_list.each_with_index do |jpts_reference, index|
      reference = ReferenceFactory::Bridge.jpts2ref(jpts_reference, index + 1)
      apa_reference_list.add_reference(ReferenceFactory::Apa.make_reference(reference))
    end

    # debug
    apa_reference_list.sort!
    (1..apa_reference_list.size).each { |i| puts "(#{apa_reference_list.author_note(i)}, #{apa_reference_list.year(i)})" }
    (1..apa_reference_list.size).each { |i| puts "(#{apa_reference_list.author_note(i)}, #{apa_reference_list.year(i)})" }
    (1..apa_reference_list.size).each { |i| puts "#{apa_reference_list.author_text(i)} (#{apa_reference_list.year(i)})" }

    apa_reference_list
  end
end

