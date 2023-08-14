# frozen_string_literal: true

require_relative "../../helper"

class TestHeading6 < Bridgetown::TestCase
  describe BridgetownNotion::MarkdownGenerators::Heading2 do
    describe "#parse" do
      it "returns heading 6 representation of text" do
        heading = JSON.parse(File.read("test/fixtures/blocks/heading_6.json"))
        
        result = BridgetownNotion::MarkdownGenerators::Heading6.new(heading).generate
        
        assert_equal "###### Register the gateway server\n", result
      end
    end
  end
end
