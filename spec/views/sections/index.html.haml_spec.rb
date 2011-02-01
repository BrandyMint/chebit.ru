require 'spec_helper'

describe "sections/index.html.haml" do
  before(:each) do
    assign(:sections, [
      stub_model(Section,
        :name => "Name",
        :desc => "MyText"
      ),
      stub_model(Section,
        :name => "Name",
        :desc => "MyText"
      )
    ])
  end

  it "renders a list of sections" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
