require 'rails_helper'

RSpec.describe Topic, type: :model do
	context 'Validation' do
		it { is_expected.to validate_presence_of :content }		
	end

	context 'Association' do
		it { is_expected.to have_many :opinions }
	end

	describe '#next_incomplete_topic' do
		let!(:topics) { create_list(:topic, 3) }
		let(:completed_topics) { [topics.first, topics.second] }

		it 'returns next topic' do
			next_topic = Topic.next_incomplete_topic(completed_topics)
			expect(next_topic).to eq topics.last
		end
	end
end