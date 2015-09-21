class Administrator < ActiveRecord::Base
	has_many :posts, dependent: :destroy

	validates :fullname, presence: true
	validates :username, presence: true
	validates :password, presence: true
end
