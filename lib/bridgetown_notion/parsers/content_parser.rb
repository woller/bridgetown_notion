# frozen_string_literal: true

require "active_support/core_ext/string/inflections"

module BridgetownNotion
  module Parsers
    class ContentParser
      def self.parse(post)
        content = ""
        blocks = post.fetch("blocks", [])
        blocks.each_with_index do |block, index|
          content += get_content(block)
          if block["type"] == "paragraph"
            content += "\n\n"
          elsif block["type"] == "bulleted_list_item" && blocks[index + 1]&["type"] != "bulleted_list_item"
            content += "\n\n"
          else
            content += "\n"
          end
        end
        content
      end

      private_class_method def self.get_content(block)
        Object.const_get(
          "BridgetownNotion::MarkdownGenerators::#{block["type"].camelize}"
        ).new(block).generate
      rescue NameError
        "\n\n```#{block["type"]} not yet implemented```\n\n"
      end
    end
  end
end
