require 'spec_helper'

RSpec.describe Sentence, :type => :model do
	it 'is valid with a content and word_id' do
		expect( build(:sentence) ).to be_valid
	end

	it 'is invalid wituout a content' do
		sentence = build(:sentence, content: nil)
		expect( sentence ).to validate_presence_of(:content)
	end
end
