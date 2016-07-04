class Admin::ContentItemsController < ApplicationController

  def index
  	@content_items = ContentItem.order(published_at: :desc)
  end

  def edit
  	@content_item = ContentItem.find(params[:id])
  end

  def update
  	@content_item = ContentItem.find(params[:id])
    if @content_item.update_attributes(content_item_params)
      redirect_to admin_content_items_path
    else 
      redirect_to admin_content_items_path
    end
  end

  def show
  	@content_item = ContentItem.find(params[:id])
  end

  private

    def content_item_params
      params.require(:content_item).permit(:image_url, :size)
    end
end