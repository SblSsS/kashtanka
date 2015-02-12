class AddNameToAsset < ActiveRecord::Migration
  def self.up
  	add_column :assets, :name, :string, default: 'default'
  end

  def self.down
  	remove_column :assets, :name
  end
end
