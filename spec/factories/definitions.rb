require 'faker'

FactoryGirl.define do
	factory :user do
		name     { Faker::Name.name }
		email    { Faker::Internet.email }
		password 'password1234'
		password_confirmation 'password1234'

		# factory :admin do
		# 	admin true
		# end

		factory :invalid_user do
			name nil
		end
	end

	factory :word do
		user
		name      'work'
		word_type 'noun'

		factory :invalid_word do
			name nil
		end
	end

	factory :sentence do
		word
		content 'I went to work'
	end
end