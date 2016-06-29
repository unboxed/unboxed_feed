class ContentItemsController < ApplicationController
	def index
		@content_items = ContentItem.where(category: ['blog', 'news']).order(published_at: :desc)
	end
end
