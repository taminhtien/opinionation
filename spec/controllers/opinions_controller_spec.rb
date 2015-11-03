require 'rails_helper'

RSpec.describe OpinionsController, type: :controller do
	describe '#new' do
		def do_request
			get :new, topic_id: topic.id
		end

		let(:topic) { create(:topic) }
		
		it 'displays the form' do
			do_request
			expect(response).to render_template :new
		end
	end

	describe '#create' do
		def do_request
			post :create, topic_id: topic.id, opinion: params
		end

		let!(:topic) { create(:topic) }

		context 'Success' do
			let(:params) { attributes_for(:opinion) } # Factory attributes_for returns a hash for post request
			it 'saves an opinion' do
				expect { do_request }.to change(Opinion, :count).by(1) 
			end
		end
	end
end