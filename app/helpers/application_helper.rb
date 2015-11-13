module ApplicationHelper
	def status_converter(status, truthy: nil, falsey: nil)
		if status
			truthy
		else
			falsey
		end
	end
end
