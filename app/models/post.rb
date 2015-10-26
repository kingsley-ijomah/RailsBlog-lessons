class Post < ActiveRecord::Base
	has_many :comments
	has_many :tags, through: :post_tags
  belongs_to :moderator
end
