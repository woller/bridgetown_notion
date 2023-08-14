module BridgetownNotion
  module Parsers
    class RichText
      def initialize(node)
        @node = node
      end

      def to_s
        node["text"]["content"]
      end

      private

      attr_reader :node
    end
  end
end
