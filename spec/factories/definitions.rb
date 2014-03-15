FactoryGirl.define do
	factory :user do
		name 'Mayuko Hirono'
		sequence(:email) { |n| 'mayuko.hirono#{n}@gmail.com' }
		password 'password1234'
		password_confirmation 'password1234'
	end

	factory :word do
		user
		name 'work'
		word_type 'noun'
	end
end