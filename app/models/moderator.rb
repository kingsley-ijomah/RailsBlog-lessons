class Moderator < ActiveRecord::Base
	has_secure_password
	
	has_many :posts, dependent: :destroy

	validates :fullname, presence: true
	validates :username, presence: true
	validates :password, presence: true
end
