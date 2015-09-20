class Tag < ActiveRecord::Base
	before_save :default_status

	has_many :post_tags
	has_many :tags, through: :post_tags

	validates :name, presence: true

	private

	def default_status
		self.status ||= 0
	end
end
