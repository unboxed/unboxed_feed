class AddPublishedAtToContentItems < ActiveRecord::Migration
  def change
    add_column :content_items, :published_at, :datetime
  end
end
