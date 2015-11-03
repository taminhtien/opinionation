class Opinion < ActiveRecord::Base
	belongs_to :topic
	validates :content, presence: true
	validates :agree, inclusion: [false, true]
end