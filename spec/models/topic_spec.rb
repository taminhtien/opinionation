require 'rails_helper'

RSpec.describe Topic, type: :model do
	context 'Validation' do
		it { is_expected.to validate_presence_of :content }		
	end

	context 'Association' do
		it { is_expected.to have_many :opinions }
	end
end