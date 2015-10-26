class Visitor < ActiveRecord::Base
	has_many :notifications, as: :notifiable
	has_many :comments
	has_many :messages
end
