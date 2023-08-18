# frozen_string_literal: true

require_relative "../../helper"

class TestCode < Bridgetown::TestCase
  describe BridgetownNotion::MarkdownGenerators::Code do
    describe "#generate" do
      it "returns code representation of text" do
        code = JSON.parse(File.read("test/fixtures/blocks/code.json"))
        expected_markdown = <<~MARKDOWN
          ```shell
          curl -s https://app.cloud66.com/server/7a0c406e2dbc3627ce8da72a01391e32/register_script.sh | bash -s
          ```
        MARKDOWN


        result = BridgetownNotion::MarkdownGenerators::Code.new(code).generate
        
        assert_equal expected_markdown, result
      end
    end
  end
end
