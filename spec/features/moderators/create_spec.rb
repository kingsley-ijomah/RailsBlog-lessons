require 'rails_helper'

feature 'Create a moderator' do
	scenario 'with in-valid fields' do
		visit new_admin_moderator_path
		save_and_open_page
	end
	scenario 'with valid fields'
end