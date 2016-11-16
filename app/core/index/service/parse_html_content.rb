require 'nokogiri'
require 'open-uri'

class Index::Service::ParseHTMLContent < Service
  def call(url)
    generage_content Nokogiri::HTML(open(url))
  rescue StandardError => e
    Rails.logger.error "Parse html content failed, error: #{e}"
    {}
  end

  private

  def generage_content(doc)
    content(doc).reject { |k, v| v.blank? }
  end

  def content(doc)
    {
      h1: title_content(doc, :h1),
      h2: title_content(doc, :h2),
      h3: title_content(doc, :h3),
      a: link_content(doc)
    }
  end

  def link_content(doc)
    doc.search(:a).map do |link|
      next unless link['href'].match(URI.regexp)
      link['href']
    end
  end

  def title_content(doc, tag)
    doc.search(tag).map(&:content).map(&:strip)
  end
end
