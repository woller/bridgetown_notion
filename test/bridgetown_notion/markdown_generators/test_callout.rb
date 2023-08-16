# frozen_string_literal: true

require_relative "../../helper"

class TestCode < Bridgetown::TestCase
  describe BridgetownNotion::MarkdownGenerators::Callout do
    describe "#generate" do
      it "returns code representation of text" do
        callout = JSON.parse(File.read("test/fixtures/blocks/callout.json"))
        expected_html = <<~HTML
          <aside class="notion_gray_background">
            <span>⚠️</span>
            <span>This is an exciting text</span>
          </aside>
        HTML

        result = BridgetownNotion::MarkdownGenerators::Callout.new(callout).generate
        
        assert_equal expected_html, result
      end
    end
  end
end
