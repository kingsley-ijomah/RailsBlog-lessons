class Visitor < ActiveRecord::Base

	has_many :notifications, as: :notifiable, dependent: :destroy
	has_many :comments, dependent: :destroy, autosave: true
	has_many :messages, dependent: :destroy

	validates :fullname, presence: true
	validates :email, format: { with: /@/, message: 'is not valid' }

	accepts_nested_attributes_for :comments

	def self.build_comment params
		visitor = Visitor.find_by(email: params[:email])
		
		if visitor
  		params[:comments_attributes].each_value{|c| visitor.comments << Comment.new(c)}
  		visitor
  	else
  		visitor = Visitor.new(params)
  	end
  end
end
