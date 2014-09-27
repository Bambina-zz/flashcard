module StatsHelper
	def get_past_6_months
		month_list = ["Jan","Feb","Mar","Apr","May","Jun",
					  "Jul","Aug","Sep","Oct","Nov","Dec",]
		current_month = Time.new().month

		past_6_months =[]
		7.times do
			past_6_months.unshift(month_list[current_month - 1])
			current_month = current_month - 1
		end
		past_6_months
	end

	def get_numbers_of_words
		return [1,2,3,4,5,6,7]
	end
end

