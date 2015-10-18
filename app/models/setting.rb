class Setting < ActiveRecord::Base
	class << self
		def site_name
			Setting.first.site_name
		end
	end
end
