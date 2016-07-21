module UnboxedTwitter
	def self.content_items
		timeline = $twitter.user_timeline("ubxd")

		timeline.each do |tweet|
			link = tweet.url.to_s
			user = tweet.user
			text = tweet.text
			created_at = tweet.created_at

			if !tweet.retweeted_status.nil?
				link = tweet.retweeted_status.url.to_s
				text = tweet.retweeted_status.text
				user = tweet.retweeted_status.user
				retweeted = true
			end

			item = ContentItem.where(url: link).first_or_create(url: link, title: text, author: user.screen_name, published_at: created_at, category: 'tweet')
			item.tag_list.add('twitter')
			item.save

			if tweet.media.first
				image_url = tweet.media.first.media_url.to_s
				item.update(image_url: image_url)
				item.save
			end
		end
	end
end
