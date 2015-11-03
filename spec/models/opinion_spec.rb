require 'rails_helper'

RSpec.describe Opinion, type: :model do
	context 'Validation' do
		it { is_expected.to validate_presence_of :content }
		it { is_expected.to validate_presence_of :agree }		
	end

	context 'Association' do
		it { is_expected.to belong_to :topic }
	end
end