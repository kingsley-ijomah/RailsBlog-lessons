require 'rails_helper'

feature 'Delete a post' do
	scenario 'successfully delete post' do
		given_that_i_have_one_post
		and_i_visit_posts_path
		when_i_click_on_delete_post
		then_i_expect_to_have_no_posts
	end
end

def given_that_i_have_one_post
	create(:post)
end

def and_i_visit_posts_path
	visit admin_posts_path
end

def when_i_click_on_delete_post
	within '.article-actions' do
		click_link 'Delete'
	end
end

def then_i_expect_to_have_no_posts
	expect(Post.count).to eq 0
end