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
        formatted_text = text.dup
        ANNOTATION_SYMBOLS.each_pair do |key, symbol|
          wrap_with_annotation(formatted_text, annotations[key], symbol) 
        end

        formatted_text
      end

      private

      attr_reader :node

      def text
        node["text"]["content"]
      end

      def annotations
        node["annotations"]
      end

      def wrap_with_annotation(text, applyable, symbol)
        return unless applyable

        text.prepend(symbol)
        text.concat(symbol) unless symbol == "<u>"
        text.concat("</u>") if symbol == "<u>"
      end
    end
  end
end
