module BridgetownNotion
  module MarkdownGenerators
    class RichTextNode
      ANNOTATION_SYMBOLS = {
        "code" => "`",
        "bold" => "**",
        "italic" => "*",
        "strikethrough" => "~~",
        "underline" => "<u>",
      }

      def initialize(node)
        @node = node
      end

      def to_s
        formatted_content = content.dup
        ANNOTATION_SYMBOLS.each_pair do |key, symbol|
          wrap_with_annotation(formatted_content, annotations[key], symbol) 
        end

        formatted_content
      end

      private

      attr_reader :node

      def content
        return node["text"]["content"] unless link

        "[#{node["text"]["content"]}](#{link})"
      end

      def annotations
        node["annotations"]
      end

      def link
        node.dig("text", "link", "url")
      end

      def wrap_with_annotation(content, applyable, symbol)
        return unless applyable

        content.prepend(symbol)
        content.concat(symbol) unless symbol == "<u>"
        content.concat("</u>") if symbol == "<u>"
      end
    end
  end
end
