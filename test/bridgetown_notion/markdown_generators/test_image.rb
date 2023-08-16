# frozen_string_literal: true

require_relative "../../helper"

class TestImage < Bridgetown::TestCase
  describe BridgetownNotion::MarkdownGenerators::Image do
    before do
      stub_request(:get, "https://example.com/image_url.png")
        .with(headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent'=>'Ruby'
        })
        .to_return(status: 200, body: File.read("test/fixtures/ruby-logo.png"), headers: {})
      @image = JSON.parse(File.read("test/fixtures/blocks/image.json"))
    end

    after do
      FileUtils.rm_rf("src/")
    end

    describe "#generate" do
      it "returns image representation of text" do
        expected_markdown = <<~MARKDOWN
          ![Ruby Logo](/images/notion/b3863426-e252-49d6-ae76-8cffbcb242fa.png)

          Ruby Logo
        MARKDOWN

        result = BridgetownNotion::MarkdownGenerators::Image.new(@image).generate
        
        assert_equal expected_markdown, result
      end

      it "saves image to src/images/notion" do
        BridgetownNotion::MarkdownGenerators::Image.new(@image).generate

        assert File.exist?("src/images/notion/b3863426-e252-49d6-ae76-8cffbcb242fa.png")
      end
    end
  end
end
