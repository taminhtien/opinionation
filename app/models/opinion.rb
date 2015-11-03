class Opinion < ActiveRecord::Base
	belongs_to :topic
	validates :content, :topic, presence: true
	validates :agree, inclusion: [false, true]
end