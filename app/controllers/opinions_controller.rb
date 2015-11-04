class OpinionsController < ApplicationController
	before_action :redirect_if_topic_is_conpleted, only: [:new]
	def new
		@opinion = current_topic.opinions.new
	end

	def create
		@opinion = current_topic.opinions.build(opinion_params)
		if @opinion.save
			mark_topic_as_completed
			redirect_to_next_topic
		else
			render :new
		end
	end

	def clear_session
		session[:completed_topics] = nil
		redirect_to_next_topic
	end

	private

		def current_topic
			if topic_id.present?
				Topic.find(topic_id)
			else
				Topic.first
			end
		end

		def topic_id
			params[:topic_id]
		end

		def opinion_params
			params.require(:opinion)
				.permit(:content, :agree)
		end

		def completed_topics
			session[:completed_topics] ||= []
		end

		def mark_topic_as_completed
			completed_topics << topic_id.to_i
		end

		def redirect_if_topic_is_conpleted
			redirect_to_next_topic if completed_topics.include? current_topic.id
		end

		def redirect_to_next_topic
			next_topic = Topic.next_incomplete_topic(completed_topics)

			if next_topic.present?
				redirect_to new_topic_opinion_url(topic_id: next_topic.id)
			else
				redirect_to thank_you_opinions_url
			end
		end
end