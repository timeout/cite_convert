require 'cite_convert/reference/authors'
require 'cite_convert/reference/author'
require 'cite_convert/reference/editors'
require 'cite_convert/reference/editor'
require 'cite_convert/reference/translator'
require 'cite_convert/reference/edition'
require 'cite_convert/reference/volume'
require 'cite_convert/reference/issue'
require 'cite_convert/reference/publication_date'
require 'cite_convert/reference/publisher'
require 'cite_convert/reference/address'
require 'cite_convert/reference/article_title'
require 'cite_convert/reference/title'
require 'cite_convert/reference/organisation'
require 'cite_convert/reference/selection'
require 'cite_convert/reference/pages'

module CiteConvert
  module Reference
    class Reference

      def initialize(index)
        @index = index
        @authors = Authors.new
        @editors = Editors.new
      end

      attr_reader :index, :authors, :editors, :translator, :title,
        :volume, :issue, :pages, :publication_date, :publisher,
        :address, :retrieval_info, :article_title, :edition,
        :organisation, :selection

      def <=>(other)
        self.index <=> other.index
      end

      def add_author(author)
        @authors << author
      end

      def add_editor(editor)
        @editors << editor
      end

      def translator= (surname, given_names)
        @translater = Translator.new(surname, given_names)
      end

      def edition= (edition)
        @edition = Edition.new(edition)
      end

      def title= (title)
        @title = Title.new(title)
      end

      def selection= (selection)
        @selection = selection
      end

      def volume= (volume)
        @volume = Volume.new(volume)
      end

      def issue= (issue)
        @issue = Issue.new(issue)
      end

      def pages= (pages)
        @pages = pages
      end

      def publication_date= (publication_date)
        @publication_date = publication_date
      end

      def publisher= (publisher)
        @publisher = Publisher.new(publisher)
      end

      def address= (address)
        @address = address
      end

      def retrieval_info(from, doi = nil)
        @retrieval_info = RetrievalInfo.new(from, doi)
      end

      def article_title= (article_title)
        @article_title = ArticleTitle.new(article_title)
      end

      def organisation= (organisation)
        @organisation = Organisation.new(organisation)
      end

      def to_s
        raise NotImplementedError.new("Abstract class")
      end
    end
  end
end
