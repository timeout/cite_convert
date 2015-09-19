module Juice
  class MarkupModel
    def self.generate(slices, paragraph)
      model = Array.new
      starts_with = slices.first.zero? ? :in_text : :text
      slices.unshift(0) unless slices.first.zero?
      slices << paragraph.length unless slices.last == paragraph.length
      slices.each_cons(2) do |pair|
        model << paragraph[(pair.first)..(pair.last - 1)]
      end
      [starts_with, model]
    end
  end
end
