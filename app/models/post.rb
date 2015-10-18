class Post < ActiveRecord::Base
  belongs_to :moderator
  has_many :post_tags, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :tags, through: :post_tags

  validates :title, presence: true
	validates :content, presence: true
	validates :moderator_id, presence: true

	def self.filter_by_tag param_tag
		includes(:tags).where(publish: true, tags: {name: param_tag}).order(id: :desc)
	end

	def self.get_published
		where(publish: true).order(id: :desc)
	end

	def self.matching_title_or_content param_search
		where("title like ? OR content like ?", "%#{param_search}%", "%#{param_search}%")
	end
end
