class ContentItemsController < ApplicationController
	def index
		@content_items = ContentItem.all
	end
end
