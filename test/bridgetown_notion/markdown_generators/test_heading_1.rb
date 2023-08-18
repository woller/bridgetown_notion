# frozen_string_literal: true

require_relative "../../helper"

class TestHeading1 < Bridgetown::TestCase
  describe BridgetownNotion::MarkdownGenerators::Heading1 do
    describe "#parse" do
      it "returns heading 1 representation of text" do
        heading = JSON.parse(File.read("test/fixtures/blocks/heading_1.json"))
        
        result = BridgetownNotion::MarkdownGenerators::Heading1.new(heading).generate
        assert_equal "# Register the gateway server", result
      end
    end
  end
end
