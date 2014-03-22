require 'spec_helper'

describe WordsController do
	before :each do
		@user = create(:user)
		login_user(@user)
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