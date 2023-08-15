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
        rich_text_node = {"type"=>"text", "text"=>{"content"=>"inline code", "link"=>nil}, "annotations"=>{"bold"=>false, "italic"=>false, "strikethrough"=>false, "underline"=>false, "code"=>true, "color"=>"default"}, "plain_text"=>"inline code", "href"=>nil}
        
        result = BridgetownNotion::MarkdownGenerators::RichTextNode.new(rich_text_node).to_s
        
        assert_equal "`inline code`", result
      end
      
      it "handles bold text" do
        rich_text_node = {"type"=>"text", "text"=>{"content"=>"bold text", "link"=>nil}, "annotations"=>{"bold"=>true, "italic"=>false, "strikethrough"=>false, "underline"=>false, "code"=>false, "color"=>"default"}, "plain_text"=>" ", "href"=>nil}
        
        result = BridgetownNotion::MarkdownGenerators::RichTextNode.new(rich_text_node).to_s
        
        assert_equal "**bold text**", result
      end

      it "handles italic text" do
        rich_text_node = {"type"=>"text", "text"=>{"content"=>"italic text", "link"=>nil}, "annotations"=>{"bold"=>false, "italic"=>true, "strikethrough"=>false, "underline"=>false, "code"=>false, "color"=>"default"}, "plain_text"=>" ", "href"=>nil}

        result = BridgetownNotion::MarkdownGenerators::RichTextNode.new(rich_text_node).to_s

        assert_equal "*italic text*", result
      end

      it "handles strikethrough text" do
        rich_text_node = {"type"=>"text", "text"=>{"content"=>"strikethrough text", "link"=>nil}, "annotations"=>{"bold"=>false, "italic"=>false, "strikethrough"=>true, "underline"=>false, "code"=>false, "color"=>"default"}, "plain_text"=>" ", "href"=>nil}

        result = BridgetownNotion::MarkdownGenerators::RichTextNode.new(rich_text_node).to_s

        assert_equal "~~strikethrough text~~", result
      end

      it "handles underline text" do
        rich_text_node = {"type"=>"text", "text"=>{"content"=>"underline text", "link"=>nil}, "annotations"=>{"bold"=>false, "italic"=>false, "strikethrough"=>false, "underline"=>true, "code"=>false, "color"=>"default"}, "plain_text"=>" ", "href"=>nil}

        result = BridgetownNotion::MarkdownGenerators::RichTextNode.new(rich_text_node).to_s

        assert_equal "<u>underline text</u>", result
      end

      it "handles both bold and italic" do
        rich_text_node = {"type"=>"text", "text"=>{"content"=>"bold and italic", "link"=>nil}, "annotations"=>{"bold"=>true, "italic"=>true, "strikethrough"=>false, "underline"=>false, "code"=>false, "color"=>"default"}, "plain_text"=>" ", "href"=>nil}

        result = BridgetownNotion::MarkdownGenerators::RichTextNode.new(rich_text_node).to_s

        assert_equal "***bold and italic***", result 
      end

      it "handles italic inline code" do
        rich_text_node = {"type"=>"text", "text"=>{"content"=>"italic inline code", "link"=>nil}, "annotations"=>{"bold"=>false, "italic"=>true, "strikethrough"=>false, "underline"=>false, "code"=>true, "color"=>"default"}, "plain_text"=>" ", "href"=>nil}

        result = BridgetownNotion::MarkdownGenerators::RichTextNode.new(rich_text_node).to_s

        assert_equal "*`italic inline code`*", result
      end
    end
  end
end
