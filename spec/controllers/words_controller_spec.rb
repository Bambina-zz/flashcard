require 'spec_helper'

describe WordsController do
	before :each do
		@user = create(:user)
		login_user(@user)
	end

	describe 'GET #index' do
		it 'populates an array of words having login_user_id' do
			word1 = create(:word, user_id: @user.id)
			word2 = create(:word, user_id: @user.id, name: 'walk')
			word3 = create(:word)
			get :index
			expect( assigns(:words) ).to match_array([word1,word2])
		end

		it 'renders the :inedx template' do
			get :index
			expect( response ).to render_template :index
		end
	end

	describe 'GET #show' do
		it 'assigns the requested word to @word' do
			word = create(:word, user_id: @user.id)
			get :show, id: word
			expect( assigns(:word) ).to eq word
		end

		it 'assigns @word which has a login_user_id' do
			word = create(:word, user_id: @user.id)
			get :show, id: word
			expect( assigns(:word).user_id ).to eq @user.id
		end

		it 'does not assign @word which made by an another user' do
			word = create(:word)
			get :show, id: word
			expect( assigns(:word) ).to eq nil
		end

		it 'renders the :show template' do
			word = create(:word, user_id: @user.id)
			get :show, id: word
			expect( response ).to render_template :show
		end
	end
end