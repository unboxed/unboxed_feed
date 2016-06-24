class AddFieldsToContentItems < ActiveRecord::Migration
  def change
    add_column :content_items, :body, :text
    add_column :content_items, :image_url, :string
    add_column :content_items, :author, :string
  end
end
