require 'cite_convert/reference/apa/apa'
require 'cite_convert/reference/apa/editors'
require 'cite_convert/reference/apa/editors_in_collection'
require 'cite_convert/reference/organisation'

module CiteConvert
  module Reference
    module Apa
      class Book < Apa
        include Comparable

        def initialize(index)
          super(index)
          @editors = Editors.new
          @editors_in_collection = EditorsInCollection.new
        end

        attr_reader :editors, :address, :publisher, :edition,
          :organisation, :selection, :pages, :editors_in_collection

        def <=> (other)
          self.primary <=> other.primary
        end

        def primary
          if self.editors_in_collection? or self.authors? or self.editors? or self.organisation?
            build_authors
          else
            build_title
          end
        end

        def add_editor(editor)
          @editors << editor
        end

        def editors?
          not self.editors.empty?
        end

        def add_editor_in_collection(editor_in_collection)
          @editors_in_collection << editor_in_collection
        end

        def editors_in_collection?
          not self.editors_in_collection.empty?
        end

        def edition= (edition)
          @edition = edition
        end

        def edition?
          not self.edition.nil?
        end

        def pages= (pages)
          @pages = pages
        end

        def pages?
          not self.pages.nil?
        end

        def selection= (selection)
          @selection = selection
        end

        def address= (address)
          @address = address
        end

        def publisher= (publisher)
          @publisher = publisher
        end

        def organisation= (organisation)
          @organisation = organisation
        end

        def organisation?
          not self.organisation.nil?
        end

        def to_s
          if self.editors_in_collection?
            "#{build_authors} (#{self.publication_date}). #{self.selection}." +
              " In #{self.editors_in_collection} (Eds.), #{build_title}" +
              " (#{build_location}). #{self.address}: #{build_publisher}."
          elsif self.authors? or self.editors? or self.organisation?
            "#{build_authors} (#{self.publication_date}). #{build_title}." +
              " #{self.address}: #{build_publisher}."
          else
            "#{build_title}. (#{self.publication_date}). #{self.address}: #{self.publisher}."
          end
        end

        private
        def build_title
          if self.edition?
            "#{self.title} (#{self.edition})"
          else
            "#{self.title}"
          end
        end

        def build_authors
          if self.authors?
            "#{self.authors}"
          elsif self.editors?
            "#{self.editors}"
          elsif self.organisation?
            "#{self.organisation}."
          else
          end
        end

        def build_publisher
          if "#{self.organisation}" == "#{self.publisher}"
            "Author"
          else
            "#{self.publisher}"
          end
        end

        def build_location
          if self.pages?
            "pp. #{self.pages}"
          end
        end
      end
    end
  end
end
