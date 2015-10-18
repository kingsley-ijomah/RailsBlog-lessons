class Setting < ActiveRecord::Base
	class << self
		def site_name
			Setting.first.site_name
		end

		def post_per_page
			Setting.first.post_per_page
		end
	end
end
