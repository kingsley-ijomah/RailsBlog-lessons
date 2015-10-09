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
end
