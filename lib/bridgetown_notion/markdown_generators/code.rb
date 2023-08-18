# frozen_string_literal: true

module BridgetownNotion
  module MarkdownGenerators
    class Code < BridgetownNotion::MarkdownGenerators::Base
      def generate
        <<~MARKDOWN
          ```#{language}
          #{rich_text}
          ```
        MARKDOWN
      end

      private

      def language
        data["language"]
      end
    end
  end
end
