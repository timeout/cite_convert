require 'cite_convert/reference'

module CiteConvert
  module ReferenceFactory
    module Bridge
      def self.jpts2ref(jpts_reference, index)
        reference = CiteConvert::Reference::Reference.new(
          jpts_reference.publication_type, index)

        # authors
        if jpts_reference.author_names? 
          jpts_reference.author_names.each do |author| 
            reference.add_author(CiteConvert::Reference::Author.new(
              author.surname, author.given_names))
          end
        end

        # editors
        if jpts_reference.editor_names?
          jpts_reference.editor_names.each do |editor|
            reference.add_editor(CiteConvert::Reference::Editor.new(
              editor.surname, editor.given_names))
          end
        end

        # publication date
        reference.publication_date = CiteConvert::Reference::PublicationDate.new(
          jpts_reference.year, jpts_reference.month, jpts_reference.day ) 

        # title
        reference.title = "#{jpts_reference.source}"

        # article title
        reference.article_title = "#{jpts_reference.article_title}" if jpts_reference.article_title?
        reference.article_title = "#{jpts_reference.chapter_title}" if jpts_reference.chapter_title?

        # volume
        reference.volume = jpts_reference.volume if jpts_reference.volume?

        # issue
        reference.issue = jpts_reference.issue if jpts_reference.issue?

        # publisher
        reference.publisher = jpts_reference.publisher_name

        # address
        if jpts_reference.publisher_loc?
          address = jpts_reference.publisher_loc
          tokens = address.split(' ')
          tokens.map! do |token|
            start = token.index(/\p{L}/)
            finish = token.rindex(/\p{L}/)
            token[start..finish]
          end

          reference.address = CiteConvert::Reference::Address.new(tokens.first, 
                                                                  tokens.last)
        end

        # pages
        reference.pages = CiteConvert::Reference::Pages.new(jpts_reference.fpage, 
                                                            jpts_reference.lpage)
        reference
      end
    end
  end
end
