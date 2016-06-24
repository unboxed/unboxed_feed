class ContentItemsController < ApplicationController
	include UnboxedBlog

	def index
		UnboxedBlog.content_items
		UnboxedTwitter.content_items
		@content_items = ContentItem.all
	end
end
