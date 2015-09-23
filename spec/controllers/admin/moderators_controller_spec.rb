require 'rails_helper'

RSpec.describe Admin::ModeratorsController, type: :controller do
	describe 'GET #index' do
		it 'assigns Moderator.all to @moderators' do
			moderators = double('moderators')
			allow(Moderator).to receive(:all).and_return(moderators)

			get :index

			expect(Moderator).to have_received(:all)
			expect(assigns[:moderators]).to eq moderators
		end
	end
	describe 'GET #new'
	describe 'POST #create'
	describe 'GET #edit'
	describe 'PUT/PATCH #update'
	describe 'GET #show'
	describe 'DELETE #destroy'
end
