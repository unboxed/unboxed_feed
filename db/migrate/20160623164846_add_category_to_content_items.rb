class AddCategoryToContentItems < ActiveRecord::Migration
  def change
  	add_column :content_items, :category, :string
  end
end
