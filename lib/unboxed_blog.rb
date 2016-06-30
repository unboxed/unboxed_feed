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
			author = node.xpath('author/name').text
			tags = JSON.parse(node.xpath('tags').text)
			time = DateTime.parse(node.xpath('published').text)
			item = ContentItem.where(url: link).first_or_create(url: link, title: title, author: author, published_at: time, category: 'blog')
			tags.each do |tag|
				item.tag_list.add(tag)
			end
			item.save
		end
	end
end