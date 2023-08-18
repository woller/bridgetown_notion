# frozen_string_literal: true

require_relative "../../helper"

class TestHeading5 < Bridgetown::TestCase
  describe BridgetownNotion::MarkdownGenerators::Heading2 do
    describe "#parse" do
      it "returns heading 5 representation of text" do
        heading = JSON.parse(File.read("test/fixtures/blocks/heading_5.json"))
        
        result = BridgetownNotion::MarkdownGenerators::Heading5.new(heading).generate
        
        assert_equal "##### Register the gateway server", result
      end
    end
  end
end
