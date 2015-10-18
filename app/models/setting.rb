class Setting < ActiveRecord::Base
	class << self
		def site_name
			Setting.first.site_name
		end

		def post_per_page
			Setting.first.post_per_page
		end

		def tag_visible?
			Setting.first.tag_visibility
		end
	end
end
