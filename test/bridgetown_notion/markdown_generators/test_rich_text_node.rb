# frozen_string_literal: true

require_relative "../../helper"

class TestRichTextNode < Bridgetown::TestCase
  describe BridgetownNotion::MarkdownGenerators::RichTextNode do
    describe "#to_s" do
      it "returns a default string when node has no annotations" do
        rich_text_node = {"type"=>"text", "text"=>{"content"=>"And some normal text with ", "link"=>nil}, "annotations"=>{"bold"=>false, "italic"=>false, "strikethrough"=>false, "underline"=>false, "code"=>false, "color"=>"default"}, "plain_text"=>"And some normal text with ", "href"=>nil}
        
        result = BridgetownNotion::MarkdownGenerators::RichTextNode.new(rich_text_node).to_s
        
        assert_equal "And some normal text with ", result
      end

      it "handles inline code" do
        # p JSON.parse(File.read("test/fixtures/blocks/paragraph_with_annotations.json"))["paragraph"]["rich_text"][1]
        rich_text_node = {"type"=>"text", "text"=>{"content"=>"inline code", "link"=>nil}, "annotations"=>{"bold"=>false, "italic"=>false, "strikethrough"=>false, "underline"=>false, "code"=>true, "color"=>"default"}, "plain_text"=>"inline code", "href"=>nil}
        
        result = BridgetownNotion::MarkdownGenerators::RichTextNode.new(rich_text_node).to_s
        
        assert_equal "`inline code`", result
      end
    end
  end
end
