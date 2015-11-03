class OpinionsController < ApplicationController
	def new
	end

	def create
		#ap opinion_params, plain: true
		topic = Topic.find(topic_id)
		@opinion = topic.opinions.build(opinion_params)
		if @opinion.save
			mark_topic_as_completed
			redirect_to_next_topic
		else
			render 'new'
		end
	end

	def thank_you
	end

	private

		def topic_id
			params[:topic_id]
		end

		def opinion_params
			params.require(:opinion)
				.permit(:content, :agree)
				.merge!(topic_id: topic_id)
		end

		def completed_topics
			session[:completed_topics] ||= []
		end

		def mark_topic_as_completed
			completed_topics << topic_id
		end

		def redirect_to_next_topic
			next_topic = Topic.next_incomplete_topic(completed_topics)
			if next_topic
				redirect_to new_topic_opinion_url(topic_id: next_topic.id)
			else
				redirect_to thank_you_opinions_url
			end
		end
end