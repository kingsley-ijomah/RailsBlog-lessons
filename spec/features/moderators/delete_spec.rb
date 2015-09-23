require 'rails_helper'

feature 'Delete a moderator' do
	scenario 'successfully delete moderator' do
		given_that_i_have_one_moderator
		and_i_visit_moderators_path
		when_i_click_on_delete
		then_i_expect_to_have_no_moderators
	end
end

def given_that_i_have_one_moderator
	create(:moderator)
end

def and_i_visit_moderators_path
	visit admin_moderators_path
end

def when_i_click_on_delete
	within '.moderator-row' do
		click_link 'Delete'
	end
end

def then_i_expect_to_have_no_moderators
	expect(Moderator.count).to eq 0
end