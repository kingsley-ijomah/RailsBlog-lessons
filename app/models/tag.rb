class Tag < ActiveRecord::Base
	has_many :posts, through: :post_tags
end
