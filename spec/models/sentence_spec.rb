require 'spec_helper'

RSpec.describe Sentence, :type => :model do
	describe 'validation' do
		let(:sentence) { build(:sentence, params) }

		context 'with valid params' do
			let(:params) { nil }
			it { expect(sentence.valid?).to be_truthy }
		end

		context 'without content' do
			let(:params) { {content: nil} }
			it { expect(sentence.valid?).to be_falsy }
		end
	end
end
