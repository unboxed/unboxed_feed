class ContentItemsController < ApplicationController
	def index
		if params[:tags]
			@content_items = ContentItem.tagged_with(params[:tags], :any => true).order(published_at: :desc)
		else
			@content_items = ContentItem.order(published_at: :desc)
		end
		@quote = Quote.order("RANDOM()").first
	end
end
