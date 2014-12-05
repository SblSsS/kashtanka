class AddParserToSetting < ActiveRecord::Migration
  def self.up
  	add_column :settings, :parser, :string
  end

  def self.down
  	remove_column :settings, :parser
  end
end
