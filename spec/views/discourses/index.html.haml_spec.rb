require 'spec_helper'

describe "discourses/index.html.haml" do
  before(:each) do
    assign(:discourses, [
      stub_model(Discourse,
        :subject => "Subject",
        :text => "MyText",
        :author_id => 1,
        :assigner_id => 1
      ),
      stub_model(Discourse,
        :subject => "Subject",
        :text => "MyText",
        :author_id => 1,
        :assigner_id => 1
      )
    ])
  end

  it "renders a list of discourses" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Subject".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
