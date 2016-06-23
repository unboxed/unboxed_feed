class ContentItemsController < ApplicationController
	include UnboxedBlog

	def index
		@content_items = ContentItem.all
		UnboxedBlog.content_items
	end
end
