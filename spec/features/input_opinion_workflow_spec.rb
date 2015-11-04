require 'rails_helper'

RSpec.describe 'Input Opinion Workflow', type: :feature do
	def fill_in_the_form
		fill_in 'opinion_content', with: opinion
		choose 'Yes'
		click_on 'Create Opinion'
	end

	let!(:topics) do
		[
			create(:topic, content: 'Is Ruby better than Python?'),
			create(:topic, content: 'Should abortion be legalized?'),
			create(:topic, content: 'Is SASS better than LESS'),
		]
	end
	let(:opinion) { 'Ruby is better!' }

	it 'allows user to input his opinion' do
		visit '/'
		expect(page).to have_content topics.first.content

		fill_in_the_form
		expect(page).to have_content topics.second.content

		fill_in_the_form
		expect(page).to have_content topics.last.content
	end
end