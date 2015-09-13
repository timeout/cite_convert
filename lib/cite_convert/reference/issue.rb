module CiteConvert
  module Reference
    class Issue
      def initialize(issue)
        @issue = issue.to_i
      end

      attr_reader :issue

      def to_s
        "#{@issue}"
      end
    end
  end
end
