module Admin::AdministratorsHelper
	def status_to_string(status, truthy: nil, falsey: nil)
		if status
			truthy.capitalize
		else
			falsey.capitalize
		end
	end
end
