class StatsController < ApplicationController
  before_filter :require_login
  include StatsHelper

  def index

    @words = Word.where( user_id: current_user.id )

    past_6_months = get_past_6_months()
    numbers_of_words = get_numbers_of_words()

    gon.push({
      :months  => past_6_months,
      :numbers => numbers_of_words
    })

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @words }
    end
  end

end
