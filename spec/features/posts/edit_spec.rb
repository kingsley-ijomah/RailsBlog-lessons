require 'rails_helper'

feature 'Editing a post' do
	scenario 'with in-valid fields' do
		given_that_i_have_one_post
		and_i_visit_post_edit_path
		when_i_submit_post_form_with_blank_fields
		then_i_expect_to_see_post_validation_errros
		then_i_expect_to_still_have_one_post
	end

	scenario 'with valid fields' do
		given_that_i_have_one_post
		and_i_visit_post_edit_path
		when_i_submit_the_post_form_with_data
		then_i_expect_to_still_have_one_post
		then_i_expect_to_see_post_edited_fullname_and_username
	end
end

# with in-valid fields

def given_that_i_have_one_post
	create(:post)
end

def and_i_visit_post_edit_path
	create(:tag) # for droplist
	visit admin_posts_path

	within '.article-actions' do
		click_link 'Edit'
	end
end

def when_i_submit_post_form_with_blank_fields
	within('.edit_post') do
		fill_in 'post_title', with: ''
		fill_in 'post_content', with: ''
		fill_in 'post_moderator_id', with: ''
	end
	click_button 'Update Post'
end

def then_i_expect_to_see_post_validation_errros
	expect(page.find('#error_explanation')).to have_content("3 errors prohibited this post from being saved")
	expect(page.find('#error_explanation')).to have_content("Title can't be blank")
	expect(page.find('#error_explanation')).to have_content("Content can't be blank")
	expect(page.find('#error_explanation')).to have_content("Moderator can't be blank")
end

def then_i_expect_to_still_have_one_post
	expect(Post.count).to eq 1
end


# with valid fields

def when_i_submit_the_post_form_with_data
	@title = Faker::Name.title
	@content = Faker::Lorem.sentence
	@moderator_id = Moderator.first.id
	
	within('.edit_post') do
		fill_in 'post_title', with: @title
		fill_in 'post_content', with: @content
		check 'post_publish'
		fill_in 'post_moderator_id', with: @moderator_id
		select Tag.first.name, from: "post_tag_ids"
	end
	click_button 'Update Post'
end

def then_i_expect_to_see_post_edited_fullname_and_username
	expect(page.find('.article-title')).to have_content(@title)
end