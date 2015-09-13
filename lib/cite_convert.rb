require 'jpts_extractor'
require 'cite_convert/reference'
require 'cite_convert/reference_list/apa'
require 'cite_convert/reference_factory/apa_periodical'
require 'cite_convert/reference_factory/apa_book'

module CiteConvert
  def self.deserialize(io)
    JPTSExtractor.extract(io)
  end

  def self.make_reference_list(article)
    article_ref_list = article.back.ref_list
    index = 1
    reference_list = CiteConvert::ReferenceList::Apa.new
    article_ref_list.each do |ref|
      reference = CiteConvert::Reference::Reference.new(index) ; index += 1

      # puts "#{ref}"
      
      if ref.author_names? 
        ref.author_names.each do |author| 
          reference.add_author(CiteConvert::Reference::Author.new(
            author.surname, author.given_names))
        end
      end

      if ref.editor_names?
        ref.editor_names.each do |editor|
          reference.add_editor(CiteConvert::Reference::Editor.new(
            editor.surname, editor.given_names))
        end
      end

      reference.publication_date = CiteConvert::Reference::PublicationDate.new(
        ref.year, ref.month, ref.day ) 

      reference.title = "#{ref.source}"

      reference.article_title = "#{ref.article_title}" if ref.article_title?

      reference.article_title = "#{ref.chapter_title}" if ref.chapter_title?

      reference.volume = ref.volume if ref.volume?

      reference.issue = ref.issue if ref.issue?

      reference.publisher = ref.publisher_name

      if ref.publisher_loc?
        address = ref.publisher_loc
        tokens = address.split(' ')
        tokens.map! do |token|
          start = token.index(/\p{L}/)
          finish = token.rindex(/\p{L}/)
          token[start..finish]
        end

        reference.address = CiteConvert::Reference::Address.new(tokens.first, tokens.last)
      end

      reference.pages = CiteConvert::Reference::Pages.new(ref.fpage, ref.lpage)

      if ref.publication_type == "journal"
        apa = CiteConvert::ReferenceFactory::ApaPeriodical.make_reference(reference)
        # puts "#{apa}"
        reference_list.add_reference(apa)

      elsif ref.publication_type == "book"
        apa = CiteConvert::ReferenceFactory::ApaBook.make_reference(reference)
        # puts "#{apa}"
        reference_list.add_reference(apa)

      else
        raise Error.new("Unknown publication type: #{ref.publication_type}")
      end
    end

    # debug
    reference_list.sort!
    (1..index - 1).each { |i| puts "(#{reference_list.author_note(i)}, #{reference_list.year(i)})" }
    (1..index - 1).each { |i| puts "(#{reference_list.author_note(i)}, #{reference_list.year(i)})" }
    (1..index - 1).each { |i| puts "#{reference_list.author_text(i)} (#{reference_list.year(i)})" }
  end
end

