class Visitor < ActiveRecord::Base
	has_many :notifications as: :notifiable
	has_many :comments, dependent: :destroy
	has_many :messages, dependent: :destroy
end
