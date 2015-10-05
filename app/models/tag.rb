class Tag < ActiveRecord::Base
	has_many :post_tags
	has_many :tags, through: :post_tags

	validates :name, presence: true

	def in_use?
		PostTag.exists?(post_id: self.id)
	end
end
