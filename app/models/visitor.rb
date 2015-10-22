class Visitor < ActiveRecord::Base
	
	include Commentable

	has_many :notifications, as: :notifiable, dependent: :destroy
	has_many :comments, dependent: :destroy, autosave: true
	has_many :messages, dependent: :destroy

	validates :fullname, presence: true
	validates :email, format: { with: /@/, message: 'is not valid' }

	accepts_nested_attributes_for :comments
end
