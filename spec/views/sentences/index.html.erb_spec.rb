require 'spec_helper'

describe "sentences/index" do
  before(:each) do
    assign(:sentences, [
      stub_model(Sentence,
        :content => "Content",
        :word_id => 1,
        :user_id => 2
      ),
      stub_model(Sentence,
        :content => "Content",
        :word_id => 1,
        :user_id => 2
      )
    ])
  end

  it "renders a list of sentences" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Content".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
