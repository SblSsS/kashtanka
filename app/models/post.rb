class Post < ActiveRecord::Base
	include Resoursable
	include Filterable
	include Translatable
  extend  FriendlyId

  friendly_id :title, use: :slugged
	acts_as_translatable :title, body: :ckeditor
	acts_as_taggable

	#Associations
	belongs_to :user
	has_one 	 :post_image, as: :viewable, dependent: :destroy

	#Validations
	validates :title, :body, presence: true
	validates :title, uniqueness: true

	#Scopes
	scope :by_title, 			-> (title) { where("posts.title ILIKE '%#{title}%' OR 
																		(translations.field_name = ? AND translations.locale = ? AND
																		translations.field_translation ILIKE '%#{title}%')", 'title', I18n.locale.to_s)
																		.references(:translations) }
	scope :by_tags,  			-> (tags)  { tagged_with(tags) }
	scope :by_published, 	-> (pub)   { where(published: pub) }

	accepts_nested_attributes_for :post_image, reject_if: :image_invalid?

	#Methods--------------------------------

	def tag_ids=(ids)
		self.tag_list = ids.select {|id| id if !id.blank?}.join(',')
	end

	def self.by_date range
		start  = !range[:start].blank? ? Date.parse(range[:start]) : nil
		finish = !range[:finish].blank? ? Date.parse(range[:finish]) : DateTime.now

		if start 
			all.where(posts: {created_at: start..finish})
		else
			all.where('posts.created_at <= ?', finish)
		end
	end

	private

		def image_invalid? attributed
			attributed[:attachment].blank?
		end

	#---------------------------------------


end
