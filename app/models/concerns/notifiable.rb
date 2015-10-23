module Notifiable
	extend ActiveSupport::Concern

	included do
    after_save :notify
  end

  def notify
    notifications.build.save
  end
end