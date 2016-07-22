class ContentItemsController < ApplicationController
	def index
		if params[:tags]
			@content_items = ContentItem.tagged_with(params[:tags], :any => true).order(published_at: :desc)
		elsif params[:temp]
			@content_items = [];
			params[:tags] = [];
		else
			@content_items = ContentItem.order(published_at: :desc)
		end
		@quote = Quote.order("RANDOM()").first
	end
end
