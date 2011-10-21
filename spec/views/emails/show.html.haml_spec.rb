require 'spec_helper'

describe "emails/show.html.haml" do
  before(:each) do
    @email = assign(:email, stub_model(Email,
      :subject => "Subject",
      :content => "MyText",
      :to => "To",
      :from => "From"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Subject/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/To/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/From/)
  end
end
