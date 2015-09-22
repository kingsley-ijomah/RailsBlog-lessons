require 'rails_helper'

feature 'Create a moderator' do
	before :each do
		visit new_admin_moderator_path
	end

	scenario 'with in-valid fields' do
		expect {
			within('#new_moderator') do
				click_button 'Create Moderator'
			end
			expect(page.find('#error_explanation')).to have_content("3 errors prohibited this moderator from being saved")
			expect(page.find('#error_explanation')).to have_content("Fullname can't be blank")
			expect(page.find('#error_explanation')).to have_content("Username can't be blank")
			expect(page.find('#error_explanation')).to have_content("Password can't be blank")
		}.to change(Moderator, :count).by(0)
	end

	scenario 'with valid fields' do
		expect {
			within('#new_moderator') do
				fill_in 'moderator_fullname', with: Faker::Name.name
				fill_in 'moderator_username', with: Faker::Internet.email
				fill_in 'moderator_password', with: Faker::Internet.password

				click_button 'Create Moderator'
			end
		}.to change(Moderator, :count).by(1)
	end
end