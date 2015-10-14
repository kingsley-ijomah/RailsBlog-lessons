class Moderator < ActiveRecord::Base
	has_secure_password
	
	has_many :posts, dependent: :destroy

	validates :fullname, presence: true
	validates :username, presence: true, uniqueness: true, format: { with: /@/, message: 'is not a valid email' }
	validates :password, presence: true
end
