# frozen_string_literal: true

require_relative "../../helper"

class TestParagraph < Bridgetown::TestCase
  describe BridgetownNotion::MarkdownGenerators::Paragraph do
    describe "#generate" do
      it "returns paragraph representation of text" do
        paragraph = JSON.parse(File.read("test/fixtures/blocks/paragraph.json"))
        
        result = BridgetownNotion::MarkdownGenerators::Paragraph.new(paragraph).generate
        
        assert_equal "As only the gateway server will have a public IP, we need to start by registering this.\n", result
      end

      it "returns paragraph representation of text with annotations" do
        paragraph = JSON.parse(File.read("test/fixtures/blocks/paragraph_with_annotations.json"))
        
        result = BridgetownNotion::MarkdownGenerators::Paragraph.new(paragraph).generate
        
        assert_equal "And some normal text with `inline code` and **bold** and *italic* ***`code`*** and some normal text that is both ***bold and italic*** and colored text\n", result
      end
    end
  end
end
