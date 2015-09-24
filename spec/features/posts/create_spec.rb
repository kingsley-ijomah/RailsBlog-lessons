require 'rails_helper'

feature 'Create a post' do

	scenario 'with in-valid fields' do
		given_that_i_have_no_posts
		given_that_i_visit_post_new_path
		and_i_submit_blank_post_form_fields
		then_i_expect_to_see_post_validation_errors
		then_i_expect_to_still_have_no_posts
	end

	scenario 'with valid fields' do
		given_that_i_have_no_posts
		given_that_i_visit_post_new_path
		and_i_submit_post_form_with_data
		then_i_expect_new_post_to_be_created
	end
end

def given_that_i_have_no_posts 
	create(:moderator)
	expect(Post.count).to eq 0
end

def given_that_i_visit_post_new_path 
	create(:tag) # for droplist
	visit new_admin_post_path
end

def and_i_submit_blank_post_form_fields 
	within('#new_post') do
		click_button 'Create Post'
	end
end

def then_i_expect_to_see_post_validation_errors 
	expect(page.find('#error_explanation')).to have_content("4 errors prohibited this post from being saved")
	expect(page.find('#error_explanation')).to have_content("Title can't be blank")
	expect(page.find('#error_explanation')).to have_content("Content can't be blank")
	expect(page.find('#error_explanation')).to have_content("Publish can't be blank")
	expect(page.find('#error_explanation')).to have_content("Moderator can't be blank")
end

def then_i_expect_to_still_have_no_posts 
	expect(Post.count).to eq 0
end

def and_i_submit_post_form_with_data
	within('#new_post') do
		fill_in 'post_title', with: Faker::Name.title
		fill_in 'post_content', with: Faker::Lorem.sentence
		check 'post_publish'
		fill_in 'post_moderator_id', with: Moderator.first.id
		select Tag.first.name, from: "post_tag_ids"
	end
	click_button 'Create Post'
end

def then_i_expect_new_post_to_be_created
	expect(Post.count).to eq 1
end
