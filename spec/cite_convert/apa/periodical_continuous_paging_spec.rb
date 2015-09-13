require 'cite_convert/reference/apa/periodical'
require 'cite_convert/reference'
require 'cite_convert/reference/author'
require 'cite_convert/reference/apa/author'
require 'cite_convert/reference/publication_date'
require 'cite_convert/reference/pages'

RSpec.describe CiteConvert::Reference::Apa::Periodical do
  describe '#initialize' do
    it 'constructs a periodical reference in the APA style' do
      CiteConvert::Reference::Apa::Periodical.new(1)
    end
  end

  describe 'An article in a journal with continuos paging' do
    it 'creates an apa reference' do
      reference = CiteConvert::Reference::Reference.new(1)
      reference.add_author(CiteConvert::Reference::Author.new('Harrison', 'Richard L.'))
      reference.add_author(CiteConvert::Reference::Author.new('Westwood', 'Marvin J.'))
      reference.publication_date=(CiteConvert::Reference::PublicationDate.new('2009'))
      reference.article_title=('Preventing vicarious traumatization of mental health therapists: Identifying protective practices')
      reference.title=('Psychotherapy: Theory, Research, Practice, Training')
      reference.volume=('46')
      reference.pages=CiteConvert::Reference::Pages.new('203', '219')

      periodical = CiteConvert::Reference::Apa::Periodical.new(1)
      reference.authors.each do |author|
        periodical.add_author(
          CiteConvert::Reference::Apa::Author.new(author.surname, author.given_names))
      end
      periodical.publication_date = reference.publication_date
      periodical.article_title = reference.article_title
      periodical.title = reference.title
      periodical.volume = reference.volume
      periodical.pages = reference.pages
      puts "#{periodical}"
      expect(periodical.to_s).to eq("Harrison, R. L., & Westwood, M. J., (2009). Preventing vicarious traumatization of mental health therapists: Identifying protective practices. Psychotherapy: Theory, Research, Practice, Training, 46, 203-219.")
    end

    it 'creates an apa reference' do
      reference = CiteConvert::Reference::Reference.new(1)
      reference.add_author(CiteConvert::Reference::Author.new('Nuttman-Schwartz', 'Orit'))
      reference.publication_date=(CiteConvert::Reference::PublicationDate.new('2007'))
      reference.article_title=('Is there life without work?')
      reference.title=('The International Journal of Aging and Human Development')
      reference.volume=('64')
      reference.pages=CiteConvert::Reference::Pages.new('129', '147')

      periodical = CiteConvert::Reference::Apa::Periodical.new(1)
      reference.authors.each do |author|
        periodical.add_author(
          CiteConvert::Reference::Apa::Author.new(author.surname, author.given_names))
      end
      periodical.publication_date = reference.publication_date
      periodical.article_title = reference.article_title
      periodical.title = reference.title
      periodical.volume = reference.volume
      periodical.pages = reference.pages
      puts "#{periodical}"
    end
  end
end
