class AddImageAndAttributionToQuotes < ActiveRecord::Migration
  def change
    add_column :quotes, :image_url, :string
    add_column :quotes, :attribution, :string
  end
end
