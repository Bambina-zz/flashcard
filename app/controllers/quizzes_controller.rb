class QuizzesController < ApplicationController
  before_filter :require_login

  def index
    @sub_title = 'Quizzes'
    @words = Word.where(user_id: current_user.id).first(1)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @words }
    end
  end

end
