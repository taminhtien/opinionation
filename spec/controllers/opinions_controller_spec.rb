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

			context 'There are incompleted topics' do
				let!(:next_topic) { create(:topic) }
				it 'redirects to next topic' do
					do_request
					expect(response).to redirect_to new_topic_opinion_url(topic_id: next_topic.id)
				end
			end

			context 'There are no more incompleted topics' do
				it 'redirects to thank you page' do
					do_request
					expect(response).to redirect_to thank_you_opinions_url
				end
			end
		end
	end
end