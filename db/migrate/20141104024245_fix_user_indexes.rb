class FixUserIndexes < ActiveRecord::Migration
  def change
  	remove_index :users, :country_id
  	remove_index :users, :language_id

    add_index :users, :country_id
    add_index :users, :language_id
  end
end
