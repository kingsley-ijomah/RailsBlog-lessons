class Visitor < ActiveRecord::Base
	has_many :notifications, as: :notifiable, dependent: :destroy
	has_many :comments, dependent: :destroy
	has_many :messages, dependent: :destroy

	validates :fullname, presence: true
	validates :email, presence: true, format: { with: /@/, message: 'is not a valid email' }

	def self.build_visitor_comment(visitor_params)
		visitor_params = visitor_params
  	comments_params = visitor_params.delete(:comments)

  	visitor = build_visitor(visitor_params, comments_params)
  end

  def self.find_or_initialize visitor_params
  	visitor = Visitor.find_or_initialize_by(email: visitor_params[:email]) do |v|
			v.fullname = visitor_params[:fullname]
		end
  end

  def self.initialize_visitor_with_comment(visitor_params, comments_params)
  	visitor = find_or_initialize(visitor_params)
		visitor.comments << Comment.new(comments_params)
		visitor
  end

  def self.build_visitor visitor_params, comments_params
  	if visitor_params[:email].nil?
  		Visitor.new(visitor_params)
  	else
  		initialize_visitor_with_comment(visitor_params, comments_params)
		end
  end
end
