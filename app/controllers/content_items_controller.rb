class ContentItemsController < ApplicationController
	def index
		# binding.pry
		@content_items = ContentItem.tagged_with(["twitter"]).order(published_at: :desc)
		@quote = Quote.order("RANDOM()").first
	end
end
