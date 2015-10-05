class PostTag < ActiveRecord::Base
  belongs_to :post
  belongs_to :tag

 # after_save :set_use_status
end
