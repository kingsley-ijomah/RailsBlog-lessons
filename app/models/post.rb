class Post < ActiveRecord::Base
  belongs_to :administrator
  has_many :post_tags
  has_many :comments
  has_many :tags, through: :post_tags
end
