class Visitor < ActiveRecord::Base
	has_many :notifications, as: :notifiable, dependent: :destroy
	has_many :comments, dependent: :destroy
	has_many :messages, dependent: :destroy

	validates :fullname, presence: true
	validates :email, presence: true, format: { with: /@/, message: 'is not a valid email' }

	def self.build_visitor_comment(visitor_params)
		visitor_params = visitor_params
  	comments_params = visitor_params.delete(:comments)

  	visitor = Visitor.find_or_initialize_by(email: visitor_params[:email]) do |v|
		  v.fullname = visitor_params[:fullname]
		end

  	visitor.comments << Comment.new(comments_params)
  	visitor
  end
end
