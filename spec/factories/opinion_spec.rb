FactoryGirl::define do
	factory :opinion do
		content 'Ruby rocks!'
		agree true
		association :topic
	end
end