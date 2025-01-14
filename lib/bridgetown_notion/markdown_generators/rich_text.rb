module BridgetownNotion
  module MarkdownGenerators
    class RichText
      def initialize(rich_text_nodes)
        @rich_text_nodes = rich_text_nodes.map do |fragment|
          RichTextNode.new(fragment)
        end
      end

      def to_s
        rich_text_nodes.map(&:to_s).join
      end
      
      private
      
      attr_reader :rich_text_nodes
    end
  end
end
