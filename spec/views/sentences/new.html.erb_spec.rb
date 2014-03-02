require 'spec_helper'

describe "sentences/new" do
  before(:each) do
    assign(:sentence, stub_model(Sentence,
      :content => "MyString",
      :word_id => 1,
      :user_id => 1
    ).as_new_record)
  end

  it "renders new sentence form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => sentences_path, :method => "post" do
      assert_select "input#sentence_content", :name => "sentence[content]"
      assert_select "input#sentence_word_id", :name => "sentence[word_id]"
      assert_select "input#sentence_user_id", :name => "sentence[user_id]"
    end
  end
end
