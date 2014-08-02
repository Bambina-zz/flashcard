class HomeController < ApplicationController
	before_filter :require_login

	def index
		if current_user
			@words = Word.where(user_id: current_user.id)
		end
	end

	def secret
	end
end
