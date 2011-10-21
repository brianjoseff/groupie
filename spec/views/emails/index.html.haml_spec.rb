require 'spec_helper'

describe "emails/index.html.haml" do
  before(:each) do
    assign(:emails, [
      stub_model(Email,
        :subject => "Subject",
        :content => "MyText",
        :to => "To",
        :from => "From"
      ),
      stub_model(Email,
        :subject => "Subject",
        :content => "MyText",
        :to => "To",
        :from => "From"
      )
    ])
  end

  it "renders a list of emails" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Subject".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "To".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "From".to_s, :count => 2
  end
end
