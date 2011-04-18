require 'spec_helper'

describe "conferences/edit.html.haml" do
  before(:each) do
    @conference = assign(:conference, stub_model(Conference,
      :name => "MyString",
      :desc => "MyText"
    ))
  end

  it "renders the edit conference form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => conferences_path(@conference), :method => "post" do
      assert_select "input#conference_name", :name => "conference[name]"
      assert_select "textarea#conference_desc", :name => "conference[desc]"
    end
  end
end
