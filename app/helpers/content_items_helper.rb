module ContentItemsHelper
	def item_class(size)
		case size
		when 1
			return 'item'
		when 2
			return 'item-medium'
		when 3
			return 'item-large'
		else
			return 'item'
		end
	end

	def all_tweets(group)
		group.all? {|i| i.category == 'tweet'}
	end

	def set_background_image(item)
		if item.image_url && item.image_url != "" 
			return "background: url(#{item.image_url}); background-size: cover; background-position: center;"
		else 
			return ""
		end
	end
end
