require 'rails_helper'

feature 'Create a post' do

	scenario 'with in-valid fields' do
		given_that_i_have_no_posts
		given_that_i_visit_post_new_path
		and_i_submit_blank_form_fields
		then_i_expect_to_see_validation_errors
		then_i_expect_to_still_have_no_posts
	end

	scenario 'with valid fields' do
		given_that_i_have_no_posts
		given_that_i_visit_post_new_path
		and_i_submit_form_with_data
		then_i_expect_new_post_to_be_created
	end
end

def given_that_i_have_no_posts 
	expect(Post.count).to eq 0
end

def given_that_i_visit_post_new_path 
	visit new_admin_post_path
end

def and_i_submit_blank_form_fields 
	within('#new_post') do
		click_button 'Create Post'
	end
end

def then_i_expect_to_see_validation_errors 
	expect(page.find('#error_explanation')).to have_content("4 errors prohibited this post from being saved")
	expect(page.find('#error_explanation')).to have_content("Title can't be blank")
	expect(page.find('#error_explanation')).to have_content("Content can't be blank")
	expect(page.find('#error_explanation')).to have_content("Publish can't be blank")
	expect(page.find('#error_explanation')).to have_content("Moderator can't be blank")
end

def then_i_expect_to_still_have_no_posts 
	expect(Post.count).to eq 0
end

def and_i_submit_form_with_data
	
	within('#new_post') do
		# fill_in 'post_title', with: Faker::Name.title
		# fill_in 'post_content', with: Faker::Lorem.sentences
		# fill_in 'post_publish', with: true
		# fill_in 'post_moderator_id', with: 1
		# select "29", from: "post_tag_ids"
		# save_and_open_page
		# click_button 'Create Post'
	end
end

def then_i_expect_new_post_to_be_created

end
