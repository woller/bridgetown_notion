# frozen_string_literal: true

require_relative "../../helper"

class TestHeading2 < Bridgetown::TestCase
  describe BridgetownNotion::MarkdownGenerators::Heading2 do
    describe "#parse" do
      it "returns heading 2 representation of text" do
        heading = JSON.parse(File.read("test/fixtures/blocks/heading_2.json"))
        
        result = BridgetownNotion::MarkdownGenerators::Heading2.new(heading).generate
        
        assert_equal "## Register the gateway server\n", result
      end
    end
  end
end
