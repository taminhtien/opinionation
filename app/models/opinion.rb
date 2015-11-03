class Opinion < ActiveRecord::Base
	belongs_to :topic
	validates :content, :agree, presence: true
end