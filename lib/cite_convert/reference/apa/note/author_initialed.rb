module CiteConvert
  module Reference
    module Apa
      module Note
        class AuthorInitialed < Author
          def initialize(author)
            super(author)
          end

          def to_s
            "#{self.initials} #{self.surname}"
          end
        end
      end
    end
  end
end
