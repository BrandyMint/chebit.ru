require 'spec_helper'

describe "discourses/edit.html.haml" do
  before(:each) do
    @discourse = assign(:discourse, stub_model(Discourse,
      :subject => "MyString",
      :text => "MyText",
      :author_id => 1,
      :assigner_id => 1
    ))
  end

  it "renders the edit discourse form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => discourse_path(@discourse), :method => "post" do
      assert_select "input#discourse_subject", :name => "discourse[subject]"
      assert_select "textarea#discourse_text", :name => "discourse[text]"
      assert_select "input#discourse_author_id", :name => "discourse[author_id]"
      assert_select "input#discourse_assigner_id", :name => "discourse[assigner_id]"
    end
  end
end
