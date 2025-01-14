# frozen_string_literal: true

module BridgetownNotion
  module MarkdownGenerators
    class Base
      def initialize(block)
        @block = block
        @rich_text = BridgetownNotion::MarkdownGenerators::RichText.new(data["rich_text"]) if data.key?("rich_text")
      end
      
      def generate
        "#{self.class::MARKDOWN_SYMBOL}#{rich_text}"
      end

      private

      attr_reader :block, :rich_text

      def name
        result = self.class.name.demodulize.underscore

        result.gsub!(/\d/, "_#{result[-1]}") if result[-1].match?(/\d/)

        result
      end

      def data
        block[name]
      end
    end
  end
end
