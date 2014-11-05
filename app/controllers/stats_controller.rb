class StatsController < ApplicationController
  before_filter :require_login
  include StatsHelper

  def index
    @sub_title = 'Statistics'
    @sub_title2 = 'See the Number of the Words'

    @words = Word.where( user_id: current_user.id )

    past_7_months = get_past_7_months()
    numbers_of_words = get_numbers_of_words(current_user)
    numbers_of_classified_words = get_numbers_of_classified_words(current_user)
    @total = @words.count
    @high_month = numbers_of_words.max
    @low_month  = numbers_of_words.min
    @high_classified = numbers_of_classified_words[4][1]
    @low_classified  = numbers_of_classified_words[0][1]

    gon.push({
      :months  => past_7_months,
      :numbers => numbers_of_words,
      :classified_numbers => numbers_of_classified_words
    })

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @words }
    end
  end

end
