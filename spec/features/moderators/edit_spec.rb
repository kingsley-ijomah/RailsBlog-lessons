require 'rails_helper'

feature 'Editing a moderator' do
	scenario 'with in-valid fields' do
		given_that_i_have_one_moderator
		and_i_visit_moderator_edit_path
		when_i_submit_form_with_blank_fields
		then_i_expect_to_see_validation_errros
		then_i_expect_to_still_have_one_moderator
	end

	scenario 'with valid fields' do
		given_that_i_have_one_moderator
		and_i_visit_moderator_edit_path
		when_i_submit_the_form_with_data
		then_i_expect_to_still_have_one_moderator
		then_i_expect_to_see_edited_fullname_and_username
	end
end

# with in-valid fields

def given_that_i_have_one_moderator
	create(:moderator)
end

def and_i_visit_moderator_edit_path
	visit admin_moderators_path

	within '.moderator-row' do
		click_link 'Edit'
	end
end

def when_i_submit_form_with_blank_fields
	within('.edit_moderator') do
		fill_in 'moderator_fullname', with: ''
		fill_in 'moderator_username', with: ''
		fill_in 'moderator_password', with: ''

		click_button 'Update Moderator'
	end
end

def then_i_expect_to_see_validation_errros
	expect(page.find('#error_explanation')).to have_content("3 errors prohibited this moderator from being saved")
	expect(page.find('#error_explanation')).to have_content("Fullname can't be blank")
	expect(page.find('#error_explanation')).to have_content("Username can't be blank")
	expect(page.find('#error_explanation')).to have_content("Password can't be blank")
end

def then_i_expect_to_still_have_one_moderator
	expect(Moderator.count).to eq 1
end


# with valid fields

def when_i_submit_the_form_with_data
	fullname = Faker::Name.name
	username = Faker::Internet.email
	password = Faker::Internet.password

	within('.edit_moderator') do
		fill_in 'moderator_fullname', with: fullname
		fill_in 'moderator_username', with: username
		fill_in 'moderator_password', with: password

		click_button 'Update Moderator'
	end
end

def then_i_expect_to_see_edited_fullname_and_username
	expect(page.find('.moderator-row')).to have_content(@fullname)
	expect(page.find('.moderator-row')).to have_content(@username)
end