# frozen_string_literal: true

require_relative "../../helper"

class TestImage < Bridgetown::TestCase
  describe BridgetownNotion::MarkdownGenerators::Image do
    describe "#generate" do
      it "returns image representation of text" do
        image = JSON.parse(File.read("test/fixtures/blocks/image.json"))
        expected_markdown = <<~MARKDOWN
          ![Untitled](image_url.png)
        MARKDOWN

        result = BridgetownNotion::MarkdownGenerators::Image.new(image).generate
        
        assert_equal expected_markdown, result
      end
    end
  end
end
