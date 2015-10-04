module Admin::AdministratorsHelper
	def status_to_string(status, truthy: nil, falsey: nil)
		if status
			truthy
		else
			falsey
		end
	end
end
