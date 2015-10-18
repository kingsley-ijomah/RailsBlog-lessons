class Comment < ActiveRecord::Base
  has_many :notifications, as: :notifiable, dependent: :destroy
  belongs_to :post
  belongs_to :visitor

  before_save :status_to_boolean

  def status_to_boolean
  	if self.status == 'true' 
  		self.status = true
  	elsif self.status == 'false'
  		self.status = false
  	end
  end

  def self.filter_by_approved status
    Comment.where(status: to_boolean(status)).order(id: :desc)
  end

  def self.to_boolean str
    str == 'true'
  end

  def self.matching_message_or_fullname search
    joins(:visitor).where("message like ? OR fullname like ?", "%#{search}%", "%#{search}%")
  end
end
