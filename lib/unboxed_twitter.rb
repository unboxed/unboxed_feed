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

			ContentItem.where(url: link).first_or_create(url: link, title: text, category: 'tweet')
		end
	end
end
