# frozen_string_literal: true

require_relative "../../helper"

class TestParagraph < Bridgetown::TestCase
  describe BridgetownNotion::MarkdownGenerators::Heading2 do
    describe "#parse" do
      it "returns paragraph representation of text" do
        paragraph = JSON.parse(File.read("test/fixtures/blocks/paragraph.json"))
        
        result = BridgetownNotion::MarkdownGenerators::Paragraph.new(paragraph).generate
        
        assert_equal "As only the gateway server will have a public IP, we need to start by registering this.\n", result
      end
    end
  end
end
