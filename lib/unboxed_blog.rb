require 'open-uri'
require 'nokogiri'
require 'pry'

module UnboxedBlog
	def self.content_items
		doc = Nokogiri::XML(open("https://unboxed.co/blog/feed.xml"))
		doc.collect_namespaces
		doc.remove_namespaces!

		doc.xpath('//entry').each do |node|
			title = node.xpath('title').text
			link = node.xpath('link/@href').text
			ContentItem.where(url: link).first_or_create(url: link, title: title)
		end
	end
end