class WordsController < ApplicationController
before_filter :require_login
  # GET /words
  # GET /words.json
  def index
    if params[:search]
      query = params[:search].downcase
      @words = Word.joins(:sentences)
              .where( user_id: current_user.id )
              .where('lower(sentences.content) like ? OR lower(name) like ?',
                     "%#{query}%", "%#{query}%")
              .order('created_at DESC')
              .page(params[:page])
    else
      @words = Word.where( user_id: current_user.id )
              .order('created_at DESC')
              .page(params[:page])
    end

    @sub_title = 'Listing Words'
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @words }
    end
  end

  # GET /words/1
  # GET /words/1.json
  def show
    word_array = Word.where( user_id: current_user.id, id: params[:id] )
    @word = word_array.any? ? word_array.last : nil

    if @word
      @sub_title = 'Listing Words'
      if @word
        @sub_title2 = @word.name
      end

      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @word }
      end
    else
      respond_to do |format|
        format.html { redirect_to root_url, :alert => "There is no such a word..." }
        format.json { head :no_content }
      end
    end
  end

  # GET /words/new
  # GET /words/new.json
  def new
    @word = Word.new
    @word.sentences.build
    @sub_title = 'Words'
    @sub_title2 = 'Create a New Word'

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @word }
    end
  end

  # GET /words/1/edit
  def edit
    word_array = Word.where( user_id: current_user.id, id: params[:id] )
    @word = word_array.any? ? word_array.last : nil
    if @word
      @sub_title = 'Listing Words'
      if @word
        @sub_title2 = @word.name
      end
      @sub_title3 = 'Edit'
    else
      respond_to do |format|
        format.html { redirect_to root_url, :alert => "There is no such a word..." }
        format.json { head :no_content }
      end
    end
  end

  # POST /words
  # POST /words.json
  def create
    @user = current_user
    @word = @user.words.create(params[:word])

    respond_to do |format|
      if @word.save
        format.html { redirect_to @word, notice: 'Word was successfully created.' }
        format.json { render json: @word, status: :created, location: @word }
      else
        format.html { render action: "new" }
        format.json { render json: @word.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /words/1
  # PUT /words/1.json
  def update
    @word = Word.find(params[:id])

    respond_to do |format|
      if @word.update_attributes(params[:word])
        format.html { redirect_to @word, notice: 'Word was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @word.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /words/1
  # DELETE /words/1.json
  def destroy
    @word = Word.find(params[:id])
    @word.destroy

    respond_to do |format|
      format.html { redirect_to words_url }
      format.json { head :no_content }
    end
  end
end
