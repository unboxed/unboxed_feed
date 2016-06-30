class ContentItemsController < ApplicationController
	def index
		@content_items = ContentItem.order(published_at: :desc)
	end
end
