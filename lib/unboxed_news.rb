require 'open-uri'
require 'nokogiri'
require 'pry'

module UnboxedNews
	def self.content_items
		doc = Nokogiri::XML(open("https://unboxed.co/news/feed.xml"))
		doc.collect_namespaces
		doc.remove_namespaces!

		doc.xpath('//entry').each do |node|
			title = node.xpath('title').text
			link = node.xpath('link/@href').text
			time = DateTime.parse(node.xpath('published').text)
			item = ContentItem.where(url: link).first_or_create(url: link, title: title, published_at: time, category: 'news')
			item.tag_list.add('news')
			item.save
		end
	end
end
