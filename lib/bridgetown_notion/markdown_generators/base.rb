# frozen_string_literal: true

module BridgetownNotion
  module MarkdownGenerators
    class Base
      def initialize(block)
        @rich_text = BridgetownNotion::Parsers::RichTextParser.new(block[name]["rich_text"])
      end
      
      def generate
        "#{self.class::MARKDOWN_SYMBOL}#{rich_text}\n"
      end

      private

      attr_reader :block, :rich_text

      def name
        result = self.class.name.demodulize.underscore

        result.gsub!(/\d/, "_#{result[-1]}") if result[-1].match?(/\d/)

        result
      end
    end
  end
end
