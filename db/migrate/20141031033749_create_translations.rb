class CreateTranslations < ActiveRecord::Migration
  def change
    create_table :translations do |t|
    	t.integer :translatable_id
    	t.string  :translatable_type
    	t.string  :locale
    	t.string  :field_name
    	t.text		:field_translation
    end

    add_index :translations, :translatable_id
  end
end
