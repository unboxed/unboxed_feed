class CreateContentItems < ActiveRecord::Migration
  def change
    create_table :content_items do |t|
      t.string :url
      t.string :title

      t.timestamps null: false
    end
  end
end
