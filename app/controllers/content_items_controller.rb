class ContentItemsController < ApplicationController
	def index
		@content_items = ContentItem.where(category: 'blog').order(published_at: :desc)
	end
end
