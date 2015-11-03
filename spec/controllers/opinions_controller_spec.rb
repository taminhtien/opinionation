require 'rails_helper'

RSpec.describe OpinionsController, type: :controller do
	describe '#new' do
		def do_request
			get :new, topic_id: topic.id
		end

		let!(:topic) { create(:topic) }
		
		it 'displays the form' do
			do_request
			expect(response).to render_template :new
		end
	end
end