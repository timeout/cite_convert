require 'cite_convert/reference/apa/periodical'
require 'cite_convert/reference'
require 'cite_convert/reference/author'
require 'cite_convert/reference/apa/author'
require 'cite_convert/reference/publication_date'
require 'cite_convert/reference/apa/publication_date'
require 'cite_convert/reference/pages'

RSpec.describe CiteConvert::Reference::Apa::Periodical do
  describe '#initialize' do
    it 'constructs a periodical reference in the APA style' do
      CiteConvert::Reference::Apa::Periodical.new(1)
    end
  end

  describe 'An article in a journal with continuos paging' do
    it 'creates an apa reference' do
      reference = CiteConvert::Reference::Reference.new('journal', 1)
      reference.add_author(CiteConvert::Reference::Author.new('Hughes', 'Jane C.'))
      reference.add_author(CiteConvert::Reference::Author.new('Brestan', 'Elizabeth V.'))
      reference.add_author(CiteConvert::Reference::Author.new('Christens', 'Brian D.'))
      reference.add_author(CiteConvert::Reference::Author.new('Klinger', 'Lori J.'))
      reference.add_author(CiteConvert::Reference::Author.new('Valle', 'Linda Anne'))
      reference.publication_date=(CiteConvert::Reference::PublicationDate.new('2004'))
      reference.article_title=('Problem-solving interactions between mothers and children')
      reference.title=('Child and Family Behavior Therapy')
      reference.volume=('26')
      reference.issue=('1')
      reference.pages=CiteConvert::Reference::Pages.new('1', '16')

      periodical = CiteConvert::Reference::Apa::Periodical.new(1)
      reference.authors.each do |author|
        periodical.add_author(
          CiteConvert::Reference::Apa::Author.new(author.surname, author.given_names))
      end
      periodical.publication_date = reference.publication_date
      periodical.article_title = reference.article_title
      periodical.title = reference.title
      periodical.volume = reference.volume
      periodical.issue = reference.issue
      periodical.pages = reference.pages
      puts "#{periodical}"
    end
  end

  describe 'An article in a monthly magazine' do
    it 'creates an apa reference' do
      reference = CiteConvert::Reference::Reference.new('journal', 1)
      reference.add_author(CiteConvert::Reference::Author.new('Martinez-Conde', 'Susana'))
      reference.add_author(CiteConvert::Reference::Author.new('Macknick', 'Stephen L.'))
      reference.publication_date=(CiteConvert::Reference::PublicationDate.new('2007', '8'))
      reference.article_title=('Windows on the mind')
      reference.title=('Scientific American')
      reference.volume=('297')
      reference.issue=('2')
      reference.pages=CiteConvert::Reference::Pages.new('56', '63')

      periodical = CiteConvert::Reference::Apa::Periodical.new(1)
      reference.authors.each do |author|
        periodical.add_author(
          CiteConvert::Reference::Apa::Author.new(author.surname, author.given_names))
      end
      periodical.publication_date = CiteConvert::Reference::Apa::PublicationDate.new(
        reference.publication_date.year, reference.publication_date.month, reference.publication_date.day)
      periodical.article_title = reference.article_title
      periodical.title = reference.title
      periodical.volume = reference.volume
      periodical.issue = reference.issue
      periodical.pages = reference.pages
      puts "#{periodical}"
    end
  end

  describe 'An article in a weekly magazine' do
    it 'creates an apa reference' do
      reference = CiteConvert::Reference::Reference.new('journal', 1)
      reference.add_author(CiteConvert::Reference::Author.new('Begley', 'S.'))
      reference.publication_date=(CiteConvert::Reference::PublicationDate.new('2007', '2', '8'))
      reference.article_title=('The depressing news about antidepressants')
      reference.title=('Newsweek')
      reference.volume=('155')
      reference.issue=('6')
      reference.pages=CiteConvert::Reference::Pages.new('34', '41')

      periodical = CiteConvert::Reference::Apa::Periodical.new(1)
      reference.authors.each do |author|
        periodical.add_author(
          CiteConvert::Reference::Apa::Author.new(author.surname, author.given_names))
      end
      periodical.publication_date = CiteConvert::Reference::Apa::PublicationDate.new(
        reference.publication_date.year, reference.publication_date.month, reference.publication_date.day)
      periodical.article_title = reference.article_title
      periodical.title = reference.title
      periodical.volume = reference.volume
      periodical.issue = reference.issue
      periodical.pages = reference.pages
      puts "#{periodical}"
    end
  end
end
