require 'spec_helper'

describe "sections/edit.html.haml" do
  before(:each) do
    @section = assign(:section, stub_model(Section,
      :name => "MyString",
      :desc => "MyText"
    ))
  end

  it "renders the edit section form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => section_path(@section), :method => "post" do
      assert_select "input#section_name", :name => "section[name]"
      assert_select "textarea#section_desc", :name => "section[desc]"
    end
  end
end
