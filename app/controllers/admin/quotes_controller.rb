class Admin::QuotesController < ApplicationController

  def index
  	@quotes = Quote.all.order(:id)
    render :layout => false
  end

  def edit
  	@quote = Quote.find(params[:id])
    render :layout => false
  end

  def update
  	@quote = Quote.find(params[:id])
    if @quote.update_attributes(quote_params)
      redirect_to edit_admin_quote_path(@quote.id)
    else 
      redirect_to admin_quote_path
    end
  end

  def show
  	@quote = Quote.find(params[:id])
  end

  private

    def quote_params
      params.require(:quote).permit(:body, :author, :image_url, :attribution, :background_colour, :text_colour)
    end
end
