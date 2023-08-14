# frozen_string_literal: true

require "active_support/core_ext/string/inflections"

module BridgetownNotion
  module Parsers
    class ContentParser
      def self.parse(post)
        content = ""
        blocks = post.fetch("blocks", [])
        blocks.each do |block|
          content += get_content(block)
        end
        content
      end

      private_class_method def self.get_content(block)
        Object.const_get(
          "BridgetownNotion::MarkdownGenerators::#{block["type"].camelize}"
        ).new(block).generate
      rescue StandardError
        "\n\n```#{block["type"]} not yet implemented```\n\n"
      end
    end
  end
end
