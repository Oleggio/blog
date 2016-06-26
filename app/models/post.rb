class Post < ActiveRecord::Base
	belongs_to :user
	has_and_belongs_to_many :tags

	validates :user_id, :text, :title, presence:true

	after_save :link_post_tag

	private

	def link_post_tag
		tag = Tag.find_by name: "Post"
		self.tag_ids = tag.id
	end
end
