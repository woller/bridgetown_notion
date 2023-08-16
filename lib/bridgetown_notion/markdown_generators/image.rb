# frozen_string_literal: true

module BridgetownNotion
  module MarkdownGenerators
    class Image < BridgetownNotion::MarkdownGenerators::Base
      def generate
        download_file

        <<~MARKDOWN
          ![#{title}](#{url})

          #{caption}
        MARKDOWN
      end

      private

      def title
        caption || "Untitled"
      end

      def caption
        RichText.new(block["image"]["caption"])
      end

      def url
        "/#{path}"
      end

      def path
        "images/notion/#{block["id"]}.png"
      end
      
      def download_file
        destination_path = "src/#{path}"

        # Create the destination directory if it doesn't exist
        FileUtils.mkdir_p(File.dirname(destination_path))

        uri = URI.parse(data["file"]["url"])
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = true

        # Download the image and save it to the destination path
        begin
          response = http.get(uri.request_uri)
          open(destination_path, 'wb') do |destination|
            destination.write(response.body)
          end
        rescue StandardError => e
          puts "Error: #{e.message}"
        end
      end
    end
  end
end
