class Topic < ActiveRecord::Base
	has_many :opinions
	validates :content, presence: true
end