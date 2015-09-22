require 'rails_helper'

feature 'Delete a moderator' do
	before :each do
		create(:moderator)
	end

	scenario 'successfully delete moderator' do
		visit admin_moderators_path
		expect {
			within '.moderator-row' do
				click_link 'Delete'
			end
		}.to change(Moderator, :count).by(-1)
	end
end