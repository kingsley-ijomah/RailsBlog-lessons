require 'rails_helper'

feature 'Editing a moderator' do
	before :each do
		create(:moderator)

		@fullname = Faker::Name.name
		@username = Faker::Internet.email

		visit admin_moderators_path

		within '.moderator-row' do
			click_link 'Edit'
		end
	end

	scenario 'with in-valid fields' do
		expect {
			within('.edit_moderator') do
				fill_in 'moderator_fullname', with: ''
				fill_in 'moderator_username', with: ''
				fill_in 'moderator_password', with: ''

				click_button 'Update Moderator'
			end
			expect(page.find('#error_explanation')).to have_content("3 errors prohibited this moderator from being saved")
			expect(page.find('#error_explanation')).to have_content("Fullname can't be blank")
			expect(page.find('#error_explanation')).to have_content("Username can't be blank")
			expect(page.find('#error_explanation')).to have_content("Password can't be blank")
		}.to change(Moderator, :count).by(0)
	end

	scenario 'with valid fields' do
		expect {
			within('.edit_moderator') do
				fill_in 'moderator_fullname', with: @fullname
				fill_in 'moderator_username', with: @username
				fill_in 'moderator_password', with: Faker::Internet.password

				click_button 'Update Moderator'
			end
		}.to change(Moderator, :count).by(0)
		expect(page.find('.moderator-row')).to have_content(@fullname)
		expect(page.find('.moderator-row')).to have_content(@username)
	end
end