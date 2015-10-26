class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :visitor
  has_many :notifications, as: :notifiable
end
