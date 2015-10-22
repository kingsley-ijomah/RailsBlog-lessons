class Visitor < ActiveRecord::Base

	has_many :notifications, as: :notifiable, dependent: :destroy
	has_many :comments, dependent: :destroy, autosave: true
	has_many :messages, dependent: :destroy

	validates :fullname, presence: true
	validates :email, format: { with: /@/, message: 'is not valid' }

	accepts_nested_attributes_for :comments

  include Messageable

	# def self.find_or_build_comment params
	# 	visitor = Visitor.find_by(email: params[:email])

	# 	if visitor
 #  		visitor.comments << Comment.new(params[:comments_attributes]["0"])
 #  		visitor
 #  	else
 #  		Visitor.new(params)
 #  	end
	# end

 #  def self.build_empty_comment
 #  	Visitor.new(comments: [Comment.new()])
 #  end

 #  def self.build_comment visitor_attr, comments_attr
 #  	Visitor.new(visitor_attr).tap do |v|
 #      v.comments = [Comment.new(comments_attr)]
 #    end
 #  end
end
