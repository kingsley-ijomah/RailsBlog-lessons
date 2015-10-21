class Visitor < ActiveRecord::Base
	
	include Commentable

	has_many :notifications, as: :notifiable, dependent: :destroy
	has_many :comments, dependent: :destroy
	has_many :messages, dependent: :destroy

	validates :fullname, presence: true
	validates :email, format: { with: /@/, message: 'is not a valid' }
end
