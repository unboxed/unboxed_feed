module ContentItemsHelper
	def item_class(index)
		case index
		when 0
			return 'item-large'
		else 
			return 'item'
		end
	end
end
