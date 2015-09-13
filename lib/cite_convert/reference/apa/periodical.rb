require 'cite_convert/reference/apa/apa'
require 'cite_convert/reference/article_title'
require 'cite_convert/reference/volume'
require 'cite_convert/reference/pages'
require 'cite_convert/reference/issue'

module CiteConvert
  module Reference
    module Apa
      class Periodical < Apa
        def initialize(index)
          super(index)
        end

        attr_reader :article_title, :volume, :pages, :issue

        def <=> (other)
          self.primary <=> other.primary
        end

        def primary
          "#{self.authors}"
        end

        def article_title= (article_title)
          @article_title = article_title
        end

        def volume= (volume)
          @volume = volume
        end

        def pages= (pages)
          @pages = pages
        end

        def issue= (issue)
          @issue = issue
        end

        def issue?
          not self.issue.nil?
        end

        def to_s
          if self.issue?
            # issue is additional requirement
            "#{self.authors}, (#{self.publication_date}). #{self.article_title}." +
              " #{self.title}, #{self.volume}(#{self.issue}), #{self.pages}." 
          else
            # basic format of journal reference string
            "#{self.authors}, (#{self.publication_date}). #{self.article_title}." +
              " #{self.title}, #{self.volume}, #{self.pages}."
          end
        end
      end
    end
  end
end
