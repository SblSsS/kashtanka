class AddPrefsToSetting < ActiveRecord::Migration
  def self.up
  	add_column :settings, :prefs, :string
  end

  def self.down
  	remove_column :settings, :prefs
  end
end
