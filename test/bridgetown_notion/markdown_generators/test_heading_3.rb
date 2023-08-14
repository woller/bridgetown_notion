# frozen_string_literal: true

require_relative "../../helper"

class TestHeading3 < Bridgetown::TestCase
  describe BridgetownNotion::MarkdownGenerators::Heading3 do
    describe "#parse" do
      it "returns heading 3 representation of text" do
        heading = JSON.parse(File.read("test/fixtures/blocks/heading_3.json"))
        
        result = BridgetownNotion::MarkdownGenerators::Heading3.new(heading).generate
        
        assert_equal "### Register the gateway server\n", result
      end
    end
  end
end
