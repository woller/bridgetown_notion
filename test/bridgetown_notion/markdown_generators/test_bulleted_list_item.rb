# frozen_string_literal: true

require_relative "../../helper"

class TestBulletedListItem < Bridgetown::TestCase
  describe BridgetownNotion::MarkdownGenerators::BulletedListItem do
    describe "#generate" do
      it "returns bullet list item representation of text" do
        bulleted_list_item = JSON.parse(File.read("test/fixtures/blocks/bulleted_list_item.json"))
        
        result = BridgetownNotion::MarkdownGenerators::BulletedListItem.new(bulleted_list_item).generate
        
        assert_equal "- 1 load balancer and gateway server\n", result
      end
    end
  end
end
