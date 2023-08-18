# frozen_string_literal: true

module BridgetownNotion
  module MarkdownGenerators
    class Callout < BridgetownNotion::MarkdownGenerators::Base
      def generate
        <<~HTML
          <aside class="#{background_color}">
            <span>#{icon}</span>
            <span>#{rich_text}</span>
          </aside>
        HTML
      end

      private
      
      def icon
        data["icon"]["emoji"]
      end

      def background_color
        "notion_#{data["color"]}"
      end
    end
  end
end
