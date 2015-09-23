require 'rails_helper'

RSpec.describe Admin::ModeratorsController, type: :controller do
	describe 'GET #index' do
		it 'assigns Moderator.all to @moderators' do
			moderators = double('moderators')
			allow(Moderator).to receive(:all).and_return(moderators)

			get 'index'

			expect(Moderator).to have_received(:all)
			expect(assigns[:moderators]).to eq moderators
		end
	end

	describe 'GET #new' do 
		it 'assigns Moderator.new to @moderator' do
			moderator = double('moderator')
			allow(Moderator).to receive(:new).and_return(moderator)

			get 'new'

			expect(Moderator).to have_received(:new)
			expect(assigns[:moderator]).to eq moderator
		end
	end

	describe 'POST #create' do
		it 'valid post' do
			moderator = double('moderator')
			attributes = attributes_for(:moderator)
			allow(Moderator).to receive(:new).with(attributes).and_return(moderator)
			allow(moderator).to receive(:save).and_return(true)

			post 'create', moderator: attributes

			expect(response).to redirect_to admin_moderators_path
			expect(Moderator).to have_received(:new).with(attributes)
			expect(moderator).to have_received(:save)
		end

		it 'invalid post' do
			moderator = double('moderator')
			attributes = attributes_for(:moderator)
			allow(Moderator).to receive(:new).with(attributes).and_return(moderator)
			allow(moderator).to receive(:save).and_return(false)

			post 'create', moderator: attributes

			expect(response).to render_template 'new'
			expect(Moderator).to have_received(:new).with(attributes)
			expect(moderator).to have_received(:save)
		end
	end

	describe 'GET #edit' do
		it 'assigns Moderator/:id to @mdoerator' do
			moderator = double('moderator', id: '1')
			allow(Moderator).to receive(:find).with(moderator.id).and_return(moderator)

			get 'edit', id: moderator.id

			expect(assigns[:moderator]).to eq moderator
			expect(Moderator).to have_received(:find).with(moderator.id)
		end
	end

	describe 'PUT/PATCH #update'
	describe 'GET #show'
	describe 'DELETE #destroy'
end
