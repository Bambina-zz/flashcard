require 'spec_helper'

describe Sentence do
	it 'is valid with a content and word_id' do
		expect( build(:sentence) ).to be_valid
	end

	it 'is invalid wituout a content' do
		sentence = build(:sentence, content: nil)
		expect( sentence ).to have(1).errors_on(:content)
	end
end
