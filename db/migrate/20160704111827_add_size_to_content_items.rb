class AddSizeToContentItems < ActiveRecord::Migration
  def change
    add_column :content_items, :size, :integer, :default => 1
  end
end
