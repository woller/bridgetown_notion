# frozen_string_literal: true

require_relative "../../helper"

class TestContentParser < Bridgetown::TestCase
  # rubocop:disable Metrics/BlockLength
  describe BridgetownNotion::Parsers::ContentParser do
    describe "#parse" do
      it "returns markdown representation of blocks" do
        post = {
          "blocks" => [{
            "heading_1" => {
              "rich_text" => [{ "text" => { "content" => "Heading 1" } }],
            },
            "type" => "heading_1"
          }, {
            "heading_2" => {
              "rich_text" => [{ "text" => { "content" => "Heading 2" } }],
            },
            "type" => "heading_2"
          }, {
            "heading_3" => {
              "rich_text" => [{ "text" => { "content" => "Heading 3" } }],
            },
            "type" => "heading_3"
          }, {
            "heading_4" => {
              "rich_text" => [{ "text" => { "content" => "Heading 4" } }],
            },
            "type" => "heading_4"
          }, {
            "heading_5" => {
              "rich_text" => [{ "text" => { "content" => "Heading 5" } }],
            },
            "type" => "heading_5"
          }, {
            "heading_6" => {
              "rich_text" => [{ "text" => { "content" => "Heading 6" } }],
            },
            "type" => "heading_6"
          }, {
            "paragraph" => {
              "rich_text" => [{ "text" => { "content" => "Paragraph text." } }],
            },
            "type" => "paragraph"
          }, {
            "bulleted_list_item" => {
              "rich_text" => [{ "text" => { "content" => "List item text." } }],
            },
            "type" => "bulleted_list_item"
          },],
        }
        expected_markdown = <<~MARKDOWN
          # Heading 1
          ## Heading 2
          ### Heading 3
          #### Heading 4
          ##### Heading 5
          ###### Heading 6
          Paragraph text.
          - List item text.
        MARKDOWN

        result = BridgetownNotion::Parsers::ContentParser.parse(post)

        assert_equal expected_markdown, result
      end

      it "returns an empty string by default" do
        result = BridgetownNotion::Parsers::ContentParser.parse({})
        assert_equal "", result
      end
    end
  end
  # rubocop:enable Metrics/BlockLength
end
