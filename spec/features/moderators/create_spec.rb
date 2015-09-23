require 'rails_helper'

feature 'Create a moderator' do
	before :each do
		given_that_i_have_no_moderators
		given_that_i_visit_moderator_new_path
	end

	scenario 'with in-valid fields' do
		and_i_submit_blank_form_fields
		then_i_expect_to_see_validation_errors
		then_i_expect_to_still_have_no_moderators
	end

	scenario 'with valid fields' do
		and_i_submit_form_with_data
		then_i_expect_new_moderator_to_be_created
	end
end

# in valid fields
def given_that_i_have_no_moderators
	expect(Moderator.count).to eq 0
end

def given_that_i_visit_moderator_new_path
	visit new_admin_moderator_path
end

def and_i_submit_blank_form_fields
	within('#new_moderator') do
		click_button 'Create Moderator'
	end
end

def then_i_expect_to_see_validation_errors
	expect(page.find('#error_explanation')).to have_content("3 errors prohibited this moderator from being saved")
	expect(page.find('#error_explanation')).to have_content("Fullname can't be blank")
	expect(page.find('#error_explanation')).to have_content("Username can't be blank")
	expect(page.find('#error_explanation')).to have_content("Password can't be blank")
end

def then_i_expect_to_still_have_no_moderators
	expect(Moderator.count).to eq 0
end

# valid data

def and_i_submit_form_with_data
	within('#new_moderator') do
		fill_in 'moderator_fullname', with: Faker::Name.name
		fill_in 'moderator_username', with: Faker::Internet.email
		fill_in 'moderator_password', with: Faker::Internet.password

		click_button 'Create Moderator'
	end
end

def then_i_expect_new_moderator_to_be_created
	expect(Moderator.count).to eq 1
end
