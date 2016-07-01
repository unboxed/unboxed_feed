class Admin::ContentItemsController < ApplicationController

  def index
  	@content_items = ContentItem.order(published_at: :desc)
  end

  def edit
  	@content_item = ContentItem.find(params[:id])
  end

  def update
  	@content_item = ContentItem.find(params[:id])
  end

  def show
  	@content_item = ContentItem.find(params[:id])
  end
end