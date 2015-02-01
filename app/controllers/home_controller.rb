class HomeController < ApplicationController
	before_filter :require_login

	def index
		if current_user
			@words = Word.where(user_id: current_user.id)

			respond_to do |format|
				format.html # index.html.erb
				format.json { render json: @words }
			end
		end
	end

	def secret
	end
end
