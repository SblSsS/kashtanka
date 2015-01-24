class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assets do |t|
    	t.integer  					:viewable_id
    	t.string   					:viewable_type
    	t.string 	 					:type
    	t.has_attached_file :attachment
    	t.string 						:alt
    	t.integer						:position

      t.timestamps
    end

  	add_index :assets, [:viewable_id], name: "index_assets_on_viewable_id"
  	add_index :assets, [:viewable_type, :type], name: "index_assets_on_viewable_type_and_type"
  end
end
