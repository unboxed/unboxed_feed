module ContentItemsHelper
	def item_class(index)
		case index
		when 0
			return 'item-large'
		else 
			return 'item'
		end
	end

	def all_tweets(group)
		group.all? {|i| i.category == 'tweet'}
	end
end
