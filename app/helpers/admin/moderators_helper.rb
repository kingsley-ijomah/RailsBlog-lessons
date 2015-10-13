module Admin::ModeratorsHelper
	def is_editable?(moderator)
		logged_in_and_global?(moderator) || moderator.is_logged_in?(current_moderator)
	end

	def logged_in_and_global?(moderator)
		moderator.is_global? && moderator.is_logged_in?(current_moderator)
	end
end
