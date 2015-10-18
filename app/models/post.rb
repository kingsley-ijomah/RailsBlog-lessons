class Post < ActiveRecord::Base
  belongs_to :moderator
  has_many :post_tags, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :tags, through: :post_tags

  validates :title, presence: true
	validates :content, presence: true
	validates :moderator_id, presence: true

	def self.filter_by_tag param_tag, param_page
		Post.includes(:tags)
			.where(publish: true, tags: {name: param_tag})
			.order(id: :desc)
			.page(param_page)
			.per(Setting.post_per_page)
	end

	def self.get_published param_page
		Post.where(publish: true).order(id: :desc).page(param_page).per(Setting.post_per_page)
	end
end
