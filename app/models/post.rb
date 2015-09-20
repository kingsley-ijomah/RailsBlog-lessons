class Post < ActiveRecord::Base
  belongs_to :administrator
  has_many :post_tags, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :tags, through: :post_tags

  validates :title, presence: true
	validates :content, presence: true
	validates :publish, presence: true
	validates :administrator_id, presence: true
end
