class Topic < ActiveRecord::Base
	has_many :opinions
	validates :content, presence: true

	def self.next_incomplete_topic(list_completed_topics)
		Topic.where.not(id: list_completed_topics).first
	end
end