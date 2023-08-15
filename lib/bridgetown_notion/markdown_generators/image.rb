# frozen_string_literal: true

module BridgetownNotion
  module MarkdownGenerators
    class Image < BridgetownNotion::MarkdownGenerators::Base
      def generate
        <<~MARKDOWN
          ![#{title}](#{url})
        MARKDOWN
      end

      private

      def title
        "Untitled"
      end

      def url
        data["file"]["url"]
      end
    end
  end
end
