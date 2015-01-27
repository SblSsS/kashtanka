class AddPublishedToAsset < ActiveRecord::Migration
  def self.up
  	add_column :assets, :published, :boolean
  end

  def self.down
  	remove_column :assets, :published
  end
end
