require 'spec_helper'

describe "discourses/show.html.haml" do
  before(:each) do
    @discourse = assign(:discourse, stub_model(Discourse,
      :subject => "Subject",
      :text => "MyText",
      :author_id => 1,
      :assigner_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Subject/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
