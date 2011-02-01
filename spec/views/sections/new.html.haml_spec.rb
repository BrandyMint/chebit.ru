require 'spec_helper'

describe "sections/new.html.haml" do
  before(:each) do
    assign(:section, stub_model(Section,
      :name => "MyString",
      :desc => "MyText"
    ).as_new_record)
  end

  it "renders new section form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => sections_path, :method => "post" do
      assert_select "input#section_name", :name => "section[name]"
      assert_select "textarea#section_desc", :name => "section[desc]"
    end
  end
end
