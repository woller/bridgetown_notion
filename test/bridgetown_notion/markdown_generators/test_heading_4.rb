# frozen_string_literal: true

require_relative "../../helper"

class TestHeading4 < Bridgetown::TestCase
  describe BridgetownNotion::MarkdownGenerators::Heading4 do
    describe "#parse" do
      it "returns heading 4 representation of text" do
        heading = JSON.parse(File.read("test/fixtures/blocks/heading_4.json"))
        
        result = BridgetownNotion::MarkdownGenerators::Heading4.new(heading).generate
        
        assert_equal "#### Register the gateway server\n", result
      end
    end
  end
end
