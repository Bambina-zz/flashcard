module StatsHelper
	def get_past_7_months
		#TODO: use strftime("%B")
		month_list = ["Jan","Feb","Mar","Apr","May","Jun",
					  "Jul","Aug","Sep","Oct","Nov","Dec",]
		current_month = Time.new().month

		past_7_months =[]
		7.times do
			past_7_months.unshift(month_list[current_month - 1])
			current_month = current_month - 1
		end
		past_7_months
	end

	def get_numbers_of_words(user)
		numbers_of_words = []
		index = 0
		7.times do
			start_month = Date.today.beginning_of_month - index.months
			end_month   = start_month + 1.month
			time_range  = start_month..end_month

			words_each_month = Word.where(user_id: user.id,created_at: time_range)
			numbers_of_words.unshift(words_each_month.count)
			index += 1
		end

		numbers_of_words
	end
end

