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
        annotations.each_pair do |annotation_key, applyable|
          wrap_with_annotation(formatted_text, annotation_key, applyable)
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

      def wrap_with_annotation(text, annotation_key, applyable)
        symbol = ANNOTATION_SYMBOLS[annotation_key]
        return unless symbol && applyable

        text.prepend(symbol)
        text.concat(symbol) unless annotation_key == "underline"
        text.concat("</u>") if annotation_key == "underline"
      end
    end
  end
end
