require 'spec_helper'

describe "emails/edit.html.haml" do
  before(:each) do
    @email = assign(:email, stub_model(Email,
      :subject => "MyString",
      :content => "MyText",
      :to => "MyString",
      :from => "MyString"
    ))
  end

  it "renders the edit email form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => emails_path(@email), :method => "post" do
      assert_select "input#email_subject", :name => "email[subject]"
      assert_select "textarea#email_content", :name => "email[content]"
      assert_select "input#email_to", :name => "email[to]"
      assert_select "input#email_from", :name => "email[from]"
    end
  end
end
