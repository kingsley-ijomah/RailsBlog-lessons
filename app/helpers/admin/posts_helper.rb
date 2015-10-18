module Admin::PostsHelper
	def double_digit_counter index
		'%02d' % (index + 1).to_s
	end
end
